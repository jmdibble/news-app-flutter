import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/utils/constants.dart';

class WebService {

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {

    final response = await http.get(Constants.headlinesFor(keyword));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {

    final response = await http.get(Constants.TOP_HEADLINES_URL);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
