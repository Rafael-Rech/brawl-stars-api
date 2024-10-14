import 'package:brawl_stars_api/service/brawl_service.dart';
import 'package:flutter/material.dart';

class ActiveEvents extends StatefulWidget {
  const ActiveEvents({super.key});

  @override
  State<ActiveEvents> createState() => _ActiveEventsState();
}

class _ActiveEventsState extends State<ActiveEvents> {
  Map iconUrls = {
    "soloShowdown":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9nbkxKdVIxRHlZTE1qUlMzV2pMTC5wbmcifQ:supercell:OfOmUHA0JeavDf4uX8SuyvQBmOq0AwN8aKuXPiM946Q?width=180",
    "duoShowdown":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9nbkxKdVIxRHlZTE1qUlMzV2pMTC5wbmcifQ:supercell:OfOmUHA0JeavDf4uX8SuyvQBmOq0AwN8aKuXPiM946Q?width=180",
    "heist":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC93MmtCcnlHZk05eHdYbWtCZWpCaC5wbmcifQ:supercell:62YMWTV9LI8syf1HAJnKJTMkUEZR1-yXNqrxVHTHrB4?width=180",
    "bounty":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC82QUR6RUR0ZGJVSzYzZ3NzV3p2ci5wbmcifQ:supercell:hvUWH6mD3onZQhEnVHEFiR0fJoGjtZyxjye3pRTYE3w?width=180",
    "gemGrab":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9mb2dXOEpvbkVpV2YzTFl0b0NNaS5wbmcifQ:supercell:3MGSQtlWFyaOAbGHmoBpr6FVdLNzQH8fbAOIUiEKODk?width=180",
    "brawlBall":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9SM1IyckRRaHBaREhMa0NCejlBUC5wbmcifQ:supercell:WkDBho-g-Ebpc8OT3q-1Y7SSmio4BXPXHTUDI8Z6SKU?width=180",
    "hotZone":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9BVXdaY01mYkJvRWN3Sk5rdUR0ZC5wbmcifQ:supercell:iZg6LAmyaKSEVwstxj2JIAlgOZgpSFMIa0yVmnaoP7Q?width=180",
    "knockout":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9nOVFZVnp1U1Z4cTM3MlJVWEx0ZS5wbmcifQ:supercell:JeQOURIdLohQGssx9Gm3eWexJD-LMeB47MZYqqp039Q?width=180",
    "duels":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9HMnhNUTljaXJRWFJUMlFpQ1VKbS5wbmcifQ:supercell:fZN_Hrzu2rqpc6Yrf0nv3X_FKFxq145Iw6faw7SAeV8?width=180",
    "unknown":
        "https://cdn-assets-eu.frontify.com/s3/frontify-enterprise-files-eu/eyJwYXRoIjoic3VwZXJjZWxsXC9maWxlXC9oZnRURHd5TllLRlNhRUJpblZkRi5wbmcifQ:supercell:3JGPmuxpg6448n3x4x2AhpmrTtjnL0JeACm_sJexZgw?width=180"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 87, 185),
        title: const Text(
          "Eventos ativos",
          style: TextStyle(color: Color.fromARGB(255, 240, 240, 240)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: getEvents(),
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
                    if (snapshot.hasError) {
                      return const Text("An error has occurred");
                    }
                    return SingleChildScrollView(
                        child: showResults(context, snapshot));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showResults(BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return Container();
    }
    List<Widget> events = [const Padding(padding: EdgeInsets.all(10.0))];

    for (int i = 0; i < snapshot.data.length; i++) {
      String date = snapshot.data[i]["endTime"];
      int year = int.parse(date.substring(0, 4));
      int month = int.parse(date.substring(4, 6));
      int day = int.parse(date.substring(6, 8));
      int hour = int.parse(date.substring(9, 11));
      DateTime endTime = DateTime.utc(year, month, day, hour);
      Duration remainingTime = endTime.difference(DateTime.now().toUtc());
      int remainingMinutes = remainingTime.inMinutes;
      int remainingHours = remainingMinutes ~/ 60;
      remainingMinutes = remainingMinutes % 60;

      String iconUrl = (iconUrls.containsKey(snapshot.data[i]["event"]["mode"])
          ? iconUrls[snapshot.data[i]["event"]["mode"]]
          : iconUrls["unknown"]);

      events.add(Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width * 0.9),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 10, 10, 10), width: 3.0),
                  color: const Color.fromARGB(255, 88, 149, 241),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      iconUrl,
                      width: 100.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data[i]["event"]["map"]}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 240, 240, 240),
                              fontSize: 30),
                        ),
                        Text(
                          "${remainingHours}h${remainingMinutes}m restando.",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 240, 240, 240),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0))
        ],
      ));
    }
    return Column(
      children: events,
    );
  }
}
