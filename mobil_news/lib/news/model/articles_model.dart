// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobil_news/news/model/source_model.dart';

class ArticlesModel {
  SourceModel source;
  String author;
  String content;
  String description;
  String publishedAt;
  String title;
  String urlToImage;
  ArticlesModel({
    required this.source,
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.urlToImage,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic>json){
    return ArticlesModel(
      source: SourceModel.fromJson(json['source']), 
      author: json['author'] ?? '',
      content: json['content'] ?? '', 
      description: json['description'] ?? '', 
      publishedAt: json['publishedAt'] ?? '', 
      title: json['title'] ?? '', 
      urlToImage: json['urlToImage'] ?? ''
      );
  }



}
