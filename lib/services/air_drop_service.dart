import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AirdropService {
  Future<bool> requestAirdrop(
    String walletAddress,
    String network,
    int amount,
  ) async {
    var url = Uri.parse('{{local}}/solana/wallet/airdrop');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    var headers = {
      'Flic-Token': token,
      'Content-Type': 'application/json',
    };
    var body = '''{
      "wallet_address": "$walletAddress",
      "network": "$network",
      "amount": $amount
    }''';

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        return true; // Airdrop was successful
      } else {
        return false; // Airdrop request failed
      }
    } catch (e) {
      return false; // Error occurred during airdrop request
    }
  }
}
