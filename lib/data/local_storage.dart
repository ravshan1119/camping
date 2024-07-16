import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final _storageUtil = LocalStorage._();

  static late SharedPreferences _preferences;

  factory LocalStorage() {
    return _storageUtil.._init();
  }

  LocalStorage._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setIsProfile(bool status) async {
    return await _preferences.setBool('is_profile', status);
  }

  bool getIsProfile() {
    return _preferences.getBool('is_profile') ?? false;
  }

  Future<bool> setToken(String token) async {
    return await _preferences.setString('token', token);
  }

  String getToken() {
    return _preferences.getString('token') ?? '';
  }

  Future<bool> setPhone(String token) async {
    return await _preferences.setString('phone', token);
  }

  String getPhone() {
    return _preferences.getString('phone') ?? '';
  }

  Future<bool> setLanguage(String language) async {
    return await _preferences.setString('language', language);
  }

  String getLanguage() {
    return _preferences.getString('language') ?? '';
  }
}
