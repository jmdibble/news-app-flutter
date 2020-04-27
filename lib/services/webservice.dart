import 'dart:convert';


import 'package:newsapp/models/newsArticle.dart';
import 'package:http/http.dart' as http;

class WebService {

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=0dcddfea904e47518a20b37072a7a97d";

    final response = await http.get(url);
    
    

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}

