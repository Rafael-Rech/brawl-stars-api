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
    // print(tag);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(snapshot.data["name"]),
        Text("${snapshot.data["trophies"]} troféus"),
        Text("${snapshot.data["brawlers"].length} brawlers"),
      ],
    );
  }
}
