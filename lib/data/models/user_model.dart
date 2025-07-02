import 'package:omniview/data/models/tab_model.dart';

class UserModel {
  final String staffId;
  final String name;
  final String role;
  final List<TabModel> tabs;

  UserModel({
    required this.staffId,
    required this.name,
    required this.role,
    required this.tabs,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      staffId: json['staffId'],
      name: json['name'],
      role: json['role'],
      tabs: (json['tabs'] as List<dynamic>)
          .map((e) => TabModel.fromJson(e))
          .toList(),
    );
  }
}
