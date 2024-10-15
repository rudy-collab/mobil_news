// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobil_news/authentication/register/model/register_model.dart';

class RegisterController extends StateNotifier<AsyncValue<RegisterModel?>> {

  Ref ref;
  Dio dio = Dio();

  RegisterController(
    this.ref,this.dio
  ) : super(const AsyncValue.loading());

  Future<void> register({required String name, required String prenom, required String email, required String sexe, required String password, required String confirmpassword})async{

    state = const AsyncValue.loading();

    try{
     
     Response response = await dio.post('http://10.0.2.2:8000/api/registerr',
     data: {
      'name':name,
      'prenom' : prenom,
      'email' : email,
      'sexe' : sexe,
      'password' : password,
      'confirmpassword' : confirmpassword
     }
     );
     
     if(response.statusCode == 200){
 var datas = response.data;
 state = AsyncValue.data(RegisterModel.fromjson(datas));
     }
    

    }catch(e,stackTrace){
if(e is DioException){
  final errorMessage = e.response!.data['error'] ??'';
  state = AsyncValue.error(errorMessage, stackTrace);
}
    }
  }

}
