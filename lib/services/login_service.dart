import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallet_app/models/login_model.dart';

class LoginService with ChangeNotifier {
  final String _baseUrl = "https://api.socialverseapp.com";

  Future<Login?> login(String username, String password) async {
    final url = Uri.parse("$_baseUrl/user/login");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'mixed': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> finalResponse = json.decode(response.body);

      return Login(
        status: finalResponse['status'],
        balance: finalResponse['balance'],
        token: finalResponse['token'],
        username: finalResponse['username'],
        email: finalResponse['email'],
        firstName: finalResponse['first_name'],
        lastName: finalResponse['last_name'],
        isVerified: finalResponse['isVerified'],
        role: finalResponse['role'],
        ownerId: finalResponse['owner_id'],
        walletAddress: finalResponse['wallet_address'],
        has_wallet: finalResponse['has_wallet'],
        lastLogin: DateTime.tryParse(finalResponse['last_login']),
        profilePictureUrl: finalResponse['profile_picture_url'],
      );
    } else {
      return null;
    }
  }
}
