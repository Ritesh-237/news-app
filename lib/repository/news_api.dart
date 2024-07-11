import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response_model.dart';

class ApiResponse {
  Future<NewsResponseModel> newsResponse() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=b83b1558d68c43428b5574b595fa3943"));
    try {
      if (response.statusCode == 200) {
        NewsResponseModel newsResponseModel =
            NewsResponseModel.fromJson(jsonDecode(response.body));
        return newsResponseModel;
      } else {
        throw Exception("network failed");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
