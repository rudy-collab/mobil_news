// ignore_for_file: public_member_api_docs, sort_constructors_first
class SourceModel {

  String? name;
  SourceModel({
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic>json){
    return SourceModel(
      name: json['name'] ?? '');
  }

}
