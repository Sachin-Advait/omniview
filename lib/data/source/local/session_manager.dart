// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SessionManager {
  static final _userStorage = GetStorage();

  static const String _tokenKey = 'Token Key';
  static const String _userIdKey = 'User Id Key';

  static Future<void> saveToken(String token) async {
    await _userStorage.write(_tokenKey, token);
    debugPrint("Token saved ==> $token.");
  }

  static String getToken() {
    String token = _userStorage.read<String?>(_tokenKey) ?? '';
    debugPrint("Token ==> $token.");
    return token;
  }

  static Future<void> saveUserId(String userId) async {
    await _userStorage.write(_userIdKey, userId);
    debugPrint("User Id saved ==> $userId.");
  }

  static String? getUserId() {
    String userId = _userStorage.read<String?>(_userIdKey) ?? '';
    debugPrint("User Id ==> $userId.");
    return userId;
  }

  static void clearSession() {
    _userStorage.erase();
    debugPrint("Session Cleared.");
  }
}
