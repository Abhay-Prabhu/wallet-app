import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/models/create_wallet_model.dart';

import '../utils/custom_exception.dart';

class CreateWalletService  {
  final prefs =  SharedPreferences.getInstance();
  final String _baseUrl = 'https://api.socialverseapp.com/solana/wallet/create'; 
  
  Future<CreateWallet?> createWallet(String walletName, String network, String userPin) async {
    final prefs = await SharedPreferences.getInstance();
    final String apiToken = prefs.getString('token').toString();

    var headers = {
      'Flic-Token': apiToken,
      'Content-Type': 'application/json'
    };

    var body = jsonEncode({
      'wallet_name': walletName,
      'network': network,
      'user_pin': userPin
    });

    var response = await http.post(
      Uri.parse('$_baseUrl/solana/wallet/create'),
      headers: headers,
      body: body,
    );

    final finalResponse = CreateWallet.fromJson(response.body);

    if (response.statusCode == 200) {
      return CreateWallet.fromJson(jsonDecode(finalResponse.toString()));
    } else {
       NetworkException(response.reasonPhrase.toString());
        //Handle Exception
      return null;
    }
  }
}
