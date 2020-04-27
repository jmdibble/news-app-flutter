import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Top News"),
        ),
      ),
      body: ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vm.articles[index].title),
          );
        },
      ),
    );
  }
}
