

import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservice.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  NewsArticleListViewModel() {
    _populateTopHeadlines();
  }

  void _populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}