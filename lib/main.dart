import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsList.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsList()
      )
    );
  }
}