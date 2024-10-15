// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobil_news/user/model/user_model.dart';

class LoginModel {

  User user;
  final String error;

  LoginModel(
   { required this.user,
    required this.error,}
  );

  factory LoginModel.fromJson(Map<String, dynamic>json){
    return LoginModel(
      user: User.fromJson(json['user'] ?? {}) ,
      error: json['error'] ?? '');
  }
}
