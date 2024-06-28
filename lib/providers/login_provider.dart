import 'package:flutter/material.dart';
import 'package:wallet_app/models/login_model.dart';
import 'package:wallet_app/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  // Instance of LoginService
  final LoginService _loginService = LoginService();

  String? _token;
  bool? _hasWallet;
  Login? _profile;
  String? _username;

  // Getters for private variables
  String? get token => _token;
  bool? get hasWallet => _hasWallet;
  Login? get profile => _profile;
  String? get username => _username;

  Future<bool> login(String username, String password) async {
    final response = await _loginService.login(username, password);

    if (response != null && response.token != null) {
      _token = response.token;
      _hasWallet = response.has_wallet;
      _profile = response;
      _username = username;
      await _store(_token!, _hasWallet, _username!);
      notifyListeners();
      return true;
    }
    return false;
  }

  // Function to store retrieved token, hasWallet, and username using SharedPreferences
  Future<void> _store(String token, bool? hasWallet, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('username', username);
    if (hasWallet != null) {
      await prefs.setBool('hasWallet', hasWallet);
    } else {
      await prefs.remove('hasWallet');
    }
  }

  // Function to retrieve token, hasWallet, and username from SharedPreferences after app starts
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _username = prefs.getString('username');
    _hasWallet = prefs.containsKey('hasWallet') ? prefs.getBool('hasWallet') : false;
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('hasWallet');
    _token = null;
    _hasWallet = null;
    _profile = null;
    _username = null;
    notifyListeners();
  }
}
