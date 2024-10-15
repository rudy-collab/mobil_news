import 'package:mobil_news/news/model/newsapidatas_model.dart';

class NewsApi{

  NewsApiDatasModel? newsApiDatasModel;



   NewsApi.fromJson(Map<String, dynamic> json):

  newsApiDatasModel = NewsApiDatasModel(json["newsApiDatasModel"]);


}