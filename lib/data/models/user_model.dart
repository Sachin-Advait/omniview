// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:omniview/data/models/tab_model.dart';

class UserModel {
  String staffId;
  String name;
  String role;
  String image;
  List<TabModel> tabs;

  UserModel({
    required this.staffId,
    required this.name,
    required this.role,
    required this.tabs,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    staffId: json["staffId"],
    name: json["name"],
    role: json["role"],
    image: json["image"],
    tabs: List<TabModel>.from(json["tabs"].map((x) => TabModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'staffId': staffId,
      'name': name,
      'role': role,
      'image': image,
      'tabs': tabs.map((x) => x.toJson()).toList(),
    };
  }
}
