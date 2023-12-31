import 'dart:convert';

import 'package:http/http.dart';

class ApiDatas {
  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };
  Future<Map> getData() async {
    Response response = await get(
        Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=us&apiKey=1c862e10c5e74882ab88901cf1aeb027"),
        headers: headers);
    Map data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      print(data);
      return data;
    } else {
      print(response.statusCode.toString());
      return {};
    }
  }

  Future<Map> getDataByCategory(String category) async {
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?apiKey=1c862e10c5e74882ab88901cf1aeb027&country=us&category=$category"));
    Map data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      print(data);
      return data;
    } else {
      print(response.statusCode.toString());
      return {};
    }
  }
}
