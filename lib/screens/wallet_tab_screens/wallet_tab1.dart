import 'package:flutter/material.dart';

class Tokens extends StatefulWidget {
  const Tokens({super.key});

  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            radius: 30,
            child: Image.asset('assets/wallet.png'),
          ),
          title: const Text(
            "WALLET",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: const Text(
            "Wallet",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Text(
            "10 rs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
