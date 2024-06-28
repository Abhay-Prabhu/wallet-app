import 'package:flutter/material.dart';
import 'package:wallet_app/providers/login_provider.dart';
import 'package:wallet_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await loginProvider.logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
      const Center(
        child: Text('Are you sure you want to logout?...'),
      ),
    ]);
  }
}
