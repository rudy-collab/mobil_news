import 'package:mobil_news/news/model/articles_model.dart';

class NewsApiDatasModel{

  List<ArticlesModel?> articles = [];

  NewsApiDatasModel(Map<String,dynamic>json){
    final list = json['articles'] as List<dynamic> ;
    articles = list.map((d)=>ArticlesModel.fromJson(d as Map<String,dynamic>)).toList();
  }
}