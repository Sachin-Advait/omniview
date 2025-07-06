// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:omniview/data/models/tab_model.dart';

class UserModel {
  String staffId;
  String name;
  String role;
  String image;
  List<TabModel> tabs;
  List<Summary> summary;

  UserModel({
    required this.staffId,
    required this.name,
    required this.role,
    required this.tabs,
    required this.image,
    required this.summary,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    staffId: json["staffId"],
    name: json["name"],
    role: json["role"],
    image: json["image"],
    tabs: List<TabModel>.from(json["tabs"].map((x) => TabModel.fromJson(x))),
    summary: List<Summary>.from(
      json["summary"].map((x) => Summary.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'staffId': staffId,
      'name': name,
      'role': role,
      'image': image,
      'tabs': tabs.map((x) => x.toJson()).toList(),
      "summary": List<dynamic>.from(summary.map((x) => x.toJson())),
    };
  }
}

class Summary {
  String value;
  String change;
  String label;

  Summary({required this.value, required this.change, required this.label});

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    value: json["value"],
    change: json["change"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "change": change,
    "label": label,
  };
}
