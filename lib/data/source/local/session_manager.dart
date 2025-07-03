// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omniview/data/models/user_model.dart';

class SessionManager {
  static final _userStorage = GetStorage();

  static const String _tokenKey = 'Token Key';
  static const String _userIdKey = 'User Id Key';
  static const String _isFirstTime = 'Is First Time Key';
  static const String _user = 'User Key';

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

  static Future<void> saveIsFirstTime(bool isFirstTime) async {
    await _userStorage.write(_isFirstTime, isFirstTime);
    debugPrint("Is First Time saved ==> $isFirstTime.");
  }

  static bool? getIsFirstTime() {
    bool isFirstTime = _userStorage.read<bool?>(_isFirstTime) ?? false;
    debugPrint("Is First Time ==> $isFirstTime.");
    return !isFirstTime;
  }

  static Future<void> saveUser(UserModel user) async {
    await _userStorage.write(_user, user.toJson());
    debugPrint("Is First Time saved ==> $user.");
  }

  static UserModel getUser() {
    final json = _userStorage.read<Map<String, dynamic>>(_user);
    if (json == null) throw Exception("User not found in storage.");

    final user = UserModel.fromJson(json);
    debugPrint("Is First Time ==> $user.");
    return user;
  }

  static void clearSession() {
    _userStorage.erase();
    debugPrint("Session Cleared.");
  }
}
