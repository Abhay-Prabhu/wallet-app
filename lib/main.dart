import 'package:flutter/material.dart';
import 'package:wallet_app/providers/create_wallet_provider.dart';
import 'package:wallet_app/providers/login_provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
import 'package:wallet_app/screens/login_screen.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => CreateWalletProvider()),
    ChangeNotifierProvider(create: (_) => WalletProvider()),
  ], child: const WalletApp()));
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: LoginScreen(),
    );
  }
}
