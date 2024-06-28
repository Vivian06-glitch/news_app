import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class NewService {
  String token = "67be6db130604ff2adf11936b9779263";
  String baseUrl = "https://newsapi.org/v2";

  Future<List<Article>> getData() async {
    final response = await http.get(
        Uri.parse("$baseUrl/top-headlines?sources=techcrunch&apiKey=$token"));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print("Json body is ${json}");
      List<dynamic> body = json["articles"];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
