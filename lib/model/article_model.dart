

import 'package:news_flutter_app_last/model/source_model.dart';

class ArticleModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    this.author,
    this.source,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json["author"],
      source: Source.fromJson(json["source"]),
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage:  json["urlToImage"],
      publishedAt:  json["publishedAt"],
      content:  json["content"],
    );
  }
}
