import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/articles/article.dart';
import 'package:flutter_application_1/src/articles/articles_item_view.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: articles.length,
      itemBuilder: (context, idx) => ArticlesItem(article: articles[idx]),
    );
  }
}
