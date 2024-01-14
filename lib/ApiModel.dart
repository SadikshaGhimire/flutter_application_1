// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

List<ApiModel> apiModelFromJson(String str) =>
    List<ApiModel>.from(json.decode(str).map((x) => ApiModel.fromJson(x)));

String apiModelToJson(List<ApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiModel {
  int id;
  String image;
  String name;
  String phone;

  ApiModel({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "phone": phone,
      };
}
