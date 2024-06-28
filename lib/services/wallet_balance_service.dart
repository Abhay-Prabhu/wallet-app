import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet_app/models/wallet_balance_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/utils/custom_exception.dart';

class WalletService {
  /// serivice call for wallet balance
  Future<Balance> getBalance(String walletAddress) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token').toString();

    try {
      if (token.isEmpty) {
        throw TokenNotFoundException('Token not found');
      }
      final Uri url = Uri.parse(
          'https://api.socialverseapp.com/solana/wallet/balance?network=devnet&wallet_address=$walletAddress');
      final response = await http.get(url, headers: {'Flic-Token': token});
      if (response.statusCode == 200) {
        return Balance.fromJson(json.decode(response.body));
      } else {
        throw NetworkException(
            'Failed to load wallet balance:${response.reasonPhrase}');
      }
    } catch (e) {
      // ignore: avoid_print
      print("Failed to load wallet balance Error :$e");
      rethrow;
    }
  }
}
