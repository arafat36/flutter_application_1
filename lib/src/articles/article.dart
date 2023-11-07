import 'dart:convert';
import 'package:flutter/services.dart';

class Article {
  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.imageUrl,
    required this.sourceName,
    required this.sourceUrl,
    required this.publishedAt,
  });

  String title, description, content, url, imageUrl, sourceName, sourceUrl;
  DateTime? publishedAt;

  factory Article.fromJson(Map<String, dynamic> data) {
    Article article = Article(
      title: data["title"],
      description: data["description"],
      content: data["content"],
      url: data["url"],
      imageUrl: data["image"],
      sourceName: data["source"]["name"],
      sourceUrl: data["source"]["url"],
      publishedAt: DateTime.parse(data["publishedAt"]),
    );
    return article;
  }
}

// Simultates api
Future<List<Article>> getArticles() async {
  final String response = await rootBundle.loadString('db.json');
  final data = await json.decode(response)["articles"] as List<dynamic>;

  List<Article> articles =
      data.map((article) => Article.fromJson(article)).toList();

  return articles;
}
