import 'dart:convert';

import 'package:http/http.dart' as http;

var baseUrl = "http://192.168.0.107:8080/";

class API {
  static Future<Map> getWorldPopulation() async {
    var url = Uri.parse(baseUrl + "world-population");

    var response = await http.get(url);
    return json.decode(utf8.decode(response.bodyBytes));
  }

  static Future<Map> getTop20() async {
    var url = Uri.parse(baseUrl + "countries/top20");

    var response = await http.get(url);
    return json.decode(utf8.decode(response.bodyBytes));
  }
    static Future<Map> search(String name) async {
    var url = Uri.parse(baseUrl + "countries/top20");

    var response = await http.get(url);
    return json.decode(utf8.decode(response.bodyBytes));
  }
}
