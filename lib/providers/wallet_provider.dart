import 'package:flutter/material.dart';
import 'package:wallet_app/models/wallet_balance_model.dart';
import 'package:wallet_app/services/wallet_balance_service.dart';
import 'package:wallet_app/utils/custom_exception.dart';

class WalletProvider with ChangeNotifier {
  Balance? _balance;
  String _errorMessage = '';
  bool _isLoading = false;

  Balance? get balance => _balance;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  final WalletService _walletService = WalletService();

  Future<void> fetchBalance(String walletAddress) async {
    _isLoading = true;
    notifyListeners();

    try {
      _balance = await _walletService.getBalance(walletAddress);
      _errorMessage = '';
    } catch (e) {
      if (e is NetworkException || e is TokenNotFoundException) {
        _errorMessage = e.toString();
      } else {
        _errorMessage = 'An unexpected error occurred';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
