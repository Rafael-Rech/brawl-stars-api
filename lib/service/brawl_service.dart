import 'dart:convert';

import 'package:http/http.dart' as http;

// final String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjcwMzhjZWQ2LTQ3YzMtNDFkNC1hMGFmLTIyN2M4YmRjNmFjNyIsImlhdCI6MTcyNzg3ODAzNSwic3ViIjoiZGV2ZWxvcGVyL2E4OTRmNmI0LWI0MDUtMDc5OC1hMjAxLTBlYmU2Njc1ZmVlNyIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiNzIuMTQuMjAxLjIzOCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.4Mbwy9VVgxkTT69hH4kz56fFlfiNVuzK8k336B1QgukgRtps21sfb7n-Atj0ssqkWKzIJHhONfUQW0UamLtQsQ";
// final String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImU3YTdiOTAwLTYzMDYtNGY3ZS1hZWU4LTAzODNmNGU4MDY5MiIsImlhdCI6MTcyODQ4MzMyNCwic3ViIjoiZGV2ZWxvcGVyL2E4OTRmNmI0LWI0MDUtMDc5OC1hMjAxLTBlYmU2Njc1ZmVlNyIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMjAwLjIwMS4xMC4xNzIiXSwidHlwZSI6ImNsaWVudCJ9XX0.9MW_lIEtVE72QtrXaFBtX3p2ALIlvrjtoQLMeLfztGTbHu2kyZSh3Au1SSiA3VwqnBhAFkCK2zk0kdgMmT8U6A";
final String token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImU3YTdiOTAwLTYzMDYtNGY3ZS1hZWU4LTAzODNmNGU4MDY5MiIsImlhdCI6MTcyODQ4MzMyNCwic3ViIjoiZGV2ZWxvcGVyL2E4OTRmNmI0LWI0MDUtMDc5OC1hMjAxLTBlYmU2Njc1ZmVlNyIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMjAwLjIwMS4xMC4xNzIiXSwidHlwZSI6ImNsaWVudCJ9XX0.9MW_lIEtVE72QtrXaFBtX3p2ALIlvrjtoQLMeLfztGTbHu2kyZSh3Au1SSiA3VwqnBhAFkCK2zk0kdgMmT8U6A";
final String baseAddress = "https://api.brawlstars.com/v1";


Future<Map> getPlayerInfo(String tag) async{
  Map<String, String> header = Map();
  header["Authorization"] = token;
  tag = "%23${tag.substring(1)}";
  http.Response response = await http.get(Uri.parse("$baseAddress/players/$tag"), headers: header);
  Map decoded = json.decode(response.body);
  return decoded;
}

Future<List> getEvents() async{
  Map<String, String> header = Map();
  header["Authorization"] = token;
  http.Response response = await http.get(Uri.parse("$baseAddress/events/rotation"), headers: header);
  List decoded = json.decode(response.body);
  return decoded;
}