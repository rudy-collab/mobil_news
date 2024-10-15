// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobil_news/authentication/login/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StateNotifier<AsyncValue<LoginModel?>> {
  
  Ref ref;
  Dio dio = Dio();

  LoginController(
    this.ref,this.dio
  ) : super(const AsyncValue.loading());


  Future<void> loginuser({required String email, required String password})async{

    state = const AsyncValue.loading();

    try{
Response response = await dio.post('http://10.0.2.2:8000/api/loggins',
data: {
  'email' : email,
  'password' : password
}
);

var datas = response.data;

var token = datas['access_token'];

if(token !=null){
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}
if(response.statusCode == 200){
state = AsyncValue.data(LoginModel.fromJson(datas));
}

    }catch(e,stackTrace){
if(e is DioException){
final errorMessage = e.response!.data['error'] ?? '';
state = AsyncValue.error(errorMessage, stackTrace);
}
    }
  }
}
