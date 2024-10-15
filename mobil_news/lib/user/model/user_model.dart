// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {

  final String name;
  final String prenom;
  final String email;
  final String sexe;
  
  User(
    {
      required this.name,
    required this.prenom,
    required this.email,
    required this.sexe,}
  );

  factory User.fromJson(Map<String,dynamic>json){
    return User(
      email:json['email'] ?? '',
      name: json['name'] ?? '',
      prenom: json['prenom'] ?? '',
      sexe: json['sexe'] ?? ''
      
      );
  }
}
