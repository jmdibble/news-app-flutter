import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'package:newsapp/widgets/newsList.dart';
import 'package:provider/provider.dart';

import 'newsArticleDetailsPage.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<NewsArticleListViewModel>(context, listen: false)
            .populateTopHeadlines());

    super.initState();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailsPage(article: article),
      ),
    );
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("No results found"));
      case LoadingStatus.completed:
        return Expanded(
            child: NewsList(
                onSelected: (article) {
                  _showNewsArticleDetails(context, article);
                },
                articles: vm.articles));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Top News"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                // fetch all the news related to the keyword
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              decoration: InputDecoration(
                  labelText: "Search articles by keyword",
                  icon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
          ),
          _buildList(context, vm)
        ],
      ),
    );
  }
}
