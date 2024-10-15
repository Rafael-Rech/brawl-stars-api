import 'package:brawl_stars_api/service/brawl_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayerSearchPage extends StatefulWidget {
  const PlayerSearchPage({super.key});

  @override
  State<PlayerSearchPage> createState() => _PlayerSearchPageState();
}

class _PlayerSearchPageState extends State<PlayerSearchPage> {
  String tag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 87, 185),
        title: const Text(
          "Busca de jogador",
          style: TextStyle(color: Color.fromARGB(255, 240, 240, 240)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(padding: EdgeInsets.all(5.0)),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Insira sua tag de jogador"),
            onSubmitted: (value) {
              setState(() {
                tag = value.startsWith("#") ? value : "#$value";
              });
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: getPlayerInfo(tag),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 122, 122, 122),
                                ),
                                strokeWidth: 5.0,
                              ),
                            ],
                          ),
                        ]);
                  default:
                    if (!snapshot.hasError) {
                      return SingleChildScrollView(
                          child: showResults(context, snapshot));
                    }
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showResults(BuildContext context, AsyncSnapshot snapshot) {
    if (tag != "") {
      if (snapshot.hasData && snapshot.data.containsKey("name")) {
        Widget pfp;
        try {
          pfp = Image.network(
            "https://cdn.brawlify.com/profile-icons/regular/${snapshot.data["icon"]["id"]}.png",
            width: 300.0,
          );
        } catch (e) {
          pfp = Container();
        }
        return Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.all(10.0)),
                  pfp.runtimeType == Image
                      ? pfp
                      : Image.network(
                          "https://cdn.brawlify.com/profile-icons/regular/28000000.png",
                          width: 300.0,
                        ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    snapshot.data["name"],
                    style: TextStyle(fontSize: 50),
                  ),
                  const Padding(padding: EdgeInsets.all(20.0)),
                  Text(
                    "${snapshot.data["trophies"]} troféus",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "${snapshot.data["brawlers"].length} brawlers",
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Padding(padding: EdgeInsets.all(20.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width * 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data["3vs3Victories"]}",
                              style: const TextStyle(fontSize: 25),
                            ),
                            const Text(
                              "Vitórias 3x3",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data["soloVictories"]}",
                              style: const TextStyle(fontSize: 25),
                            ),
                            const Text(
                              "Vitórias solo",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data["duoVictories"]}",
                              style: const TextStyle(fontSize: 25),
                            ),
                            const Text(
                              "Vitórias em dupla",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }
      return Column(
        children: const [
          Text(
            "Tag inválida!",
            style: TextStyle(
                color: Color.fromARGB(255, 240, 10, 10), fontSize: 25),
          ),
        ],
      );
    }
    return Container();
  }
}
