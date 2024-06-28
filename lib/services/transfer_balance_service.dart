import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/models/transfer_balance.dart';
import 'package:wallet_app/utils/custom_exception.dart';

class BalanceTransfer {
  ///Transfer balance class

  Future makeTransfer(
    String recipientAddress,
    String network,
    String senderAddress,
    int amount,
    String userPin,
  ) async {
    var url =
        Uri.parse('https://api.socialverseapp.com/solana/wallet/transfer');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Flic-Token': '$token',
      'Content-Type': 'application/json',
    };
    var body = '''{
      "recipient_address": "$recipientAddress",
      "network": "$network",
      "sender_address": "$senderAddress",
      "amount": $amount,
      "user_pin": "$userPin"
    }''';

    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final finalResponse = TransferBalance.fromJson(response.body);
        return finalResponse;
        // Navigate to the WalletScreen or show a success message
      } else {
        NetworkException(response.reasonPhrase.toString());
        //Handle Exception
      }
    } catch (e) {
      print('Error during transfer: $e');
      // Show error message to the user
    }
  }
}
