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
}
