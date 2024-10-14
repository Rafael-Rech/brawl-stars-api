import 'package:brawl_stars_api/view/active_events_page.dart';
import 'package:brawl_stars_api/view/player_search_page.dart';
import 'package:flutter/material.dart';

import '../service/brawl_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resposta = "";
  bool pressed = false;
  final appbar = AppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Brawl Stars Info",
          style: TextStyle(
              color: Color.fromARGB(255, 240, 240, 240), fontSize: 23.0),
        ),
        backgroundColor: const Color.fromARGB(255, 22, 87, 185),
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.9),
                        height: ((MediaQuery.of(context).size.height -
                                appbar.preferredSize.height) /
                            3.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 10, 10, 10),
                              width: 3.0),
                          color: const Color.fromARGB(255, 88, 149, 241),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9CczFXRDdhZnZ5U1dWSzRkTjF6RC5wbmcifQ:supercell:zlQD0cCKVcI-8Zcz7HTtc0Jk0s7NJxWimIbQjWc_2QU?width=800"),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Text(
                                      "Eventos ativos",
                                      style: TextStyle(
                                        fontSize: 40,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color =
                                              Color.fromARGB(255, 10, 10, 10),
                                      ),
                                    ),
                                    const Text(
                                      "Eventos ativos",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 240, 240, 240),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ActiveEvents())));
                      },
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.9),
                        height: ((MediaQuery.of(context).size.height -
                                appbar.preferredSize.height) /
                            3.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 10, 10, 10),
                              width: 3.0),
                          color: const Color.fromARGB(255, 88, 149, 241),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9HNHVSR0d5RDZWa0hqaFlIRnd3Qy5wbmcifQ:supercell:lGyc76IQni7ATAxC1e1yzl8RiZuwpPESw43Hv57DgJo?width=800"),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Text(
                                      "Dados de jogadores",
                                      style: TextStyle(
                                        fontSize: 40,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color =
                                              Color.fromARGB(255, 10, 10, 10),
                                      ),
                                    ),
                                    const Text(
                                      "Dados de jogadores",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color:
                                            Color.fromARGB(255, 240, 240, 240),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PlayerSearchPage())));
                      },
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Container(
                  width: (MediaQuery.of(context).size.width * 0.9),
                  child: const Text(
                    "Este material não é oficial e não é aprovado pela Supercell. Para mais informações, consulte a Política de Conteúdo para Fãs: http://supercell.com/en/fan-content-policy/pt",
                    style: TextStyle(
                      color: Color.fromARGB(255, 80, 80, 80),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
              ],
            ),
          );
        },
      ),
    );
  }
}
