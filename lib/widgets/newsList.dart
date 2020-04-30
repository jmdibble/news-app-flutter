import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsArticleDetailsPage.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return Container(
//          height: 100,
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: ListTile(
                  onTap: () {
                    this.onSelected(article);
                  },
                  leading: Container(
                    width: 100,
                    height: 100,
                    child: article.imageURL == null
                        ? Image.asset("images/news-placeholder.jpg")
                        : Image.network(article.imageURL),
                  ),
                  title: Text(article.title),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
