// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:omniview/data/models/tab_model.dart';

class UserModel {
  String staffId;
  String name;
  String role;
  List<TabModel> tabs;

  UserModel({
    required this.staffId,
    required this.name,
    required this.role,
    required this.tabs,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    staffId: json["staffId"],
    name: json["name"],
    role: json["role"],
    tabs: List<TabModel>.from(json["tabs"].map((x) => TabModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'staffId': staffId,
      'name': name,
      'role': role,
      'tabs': tabs.map((x) => x.toJson()).toList(),
    };
  }
}
