// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {

  final String success;
  final String error;

  RegisterModel(
   { required this.success,
    required this.error,}
  );

  factory RegisterModel.fromjson(Map<String,dynamic>json){
    return RegisterModel(
      error: json['error']??'',
      success: json['success'] ?? ''
      
      );
  }
}
