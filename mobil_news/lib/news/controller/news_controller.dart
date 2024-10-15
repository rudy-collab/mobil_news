// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobil_news/news/model/newsapi_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends StateNotifier<AsyncValue<NewsApi?>> {

  Ref ref;


  NewsController(
    this.ref
  ) : super(const AsyncValue.loading());

Future<void> getNews({required String country, required String category})async{

  state = const AsyncValue.loading();

  try{
final response = await http.get(
  Uri.parse('https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=818455d160f54844bbd0531d0fbabb12',

  )
  
);

final jsonData = json.decode(response.body);

  state = AsyncValue.data(NewsApi.fromJson(jsonData));

  }catch(errorMessage,stackTrace){

  state = AsyncValue.error(errorMessage, stackTrace);

  }
}

}
