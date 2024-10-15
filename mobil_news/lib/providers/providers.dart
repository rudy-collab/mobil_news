
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobil_news/authentication/login/controller/login_controller.dart';
import 'package:mobil_news/authentication/login/model/login_model.dart';
import 'package:mobil_news/authentication/register/controller/register_controller.dart';
import 'package:mobil_news/authentication/register/model/register_model.dart';
import 'package:mobil_news/news/controller/news_controller.dart';
import 'package:mobil_news/news/model/articles_model.dart';
import 'package:mobil_news/news/model/newsapi_model.dart';


final registers = StateNotifierProvider<RegisterController,AsyncValue<RegisterModel?>>((ref)=>RegisterController(ref, Dio()));
final loginss = StateNotifierProvider<LoginController,AsyncValue<LoginModel?>>((ref)=>LoginController(ref, Dio()));
final newss = StateNotifierProvider<NewsController,AsyncValue<NewsApi?>>((ref)=>NewsController(ref));