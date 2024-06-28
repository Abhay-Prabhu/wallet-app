import 'package:flutter/material.dart';
import 'package:wallet_app/models/create_wallet_model.dart';
import 'package:wallet_app/services/create_wallet_service.dart';

class CreateWalletProvider with ChangeNotifier {
  final CreateWalletService _createWalletService = CreateWalletService();

  CreateWallet? _walletCreationResponse;

  CreateWallet? get walletCreationResponse => _walletCreationResponse;

  Future<bool> createWallet(String walletName, String network, String userPin) async {
    final response = await _createWalletService.createWallet(walletName, network, userPin);

    if (response != null && response.status == 'success') {
      _walletCreationResponse = response;
      notifyListeners();
      return true;
    }
    return false;
  }
}
