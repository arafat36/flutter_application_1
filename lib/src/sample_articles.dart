import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/articles/article.dart';
import 'package:flutter_application_1/src/articles/articles_list_view.dart';

class SampleArticles extends StatelessWidget {
  const SampleArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArticles(),
      builder: (context, snapshot) =>
          (ArticlesList(articles: snapshot.data ?? <Article>[])),
    );
  }
}
