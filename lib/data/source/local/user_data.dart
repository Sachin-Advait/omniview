import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:omniview/data/models/user_model.dart';

class UserDataLocalSource {
  Future<List<UserModel>> loadUsers() async {
    final jsonString = await rootBundle.loadString('assets/data/users.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<UserModel?> getUserByStaffId(String staffId) async {
    final users = await loadUsers();
    final matched = users.where((user) => user.staffId == staffId);
    return matched.isNotEmpty ? matched.first : null;
  }
}
