import 'dart:convert';

import 'package:http/http.dart' as http;

// final String baseAddress = "https://api.brawlstars.com/v1";
// final String token = "Bearer token";

Future<Map> getPlayerInfo(String tag) async {
  if (tag != "") {
    Map<String, String> header = Map();
    header["Authorization"] = token;
    tag = "%23${tag.substring(1)}";
    http.Response response =
        await http.get(Uri.parse("$baseAddress/players/$tag"), headers: header);
    Map decoded = json.decode(response.body);
    return decoded;
  }
  return Map();
}

Future<List> getEvents() async {
  Map<String, String> header = Map();
  header["Authorization"] = token;
  http.Response response = await http
      .get(Uri.parse("$baseAddress/events/rotation"), headers: header);
  List decoded = json.decode(response.body);
  return decoded;
}
