import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
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
            backgroundColor: Colors.greenAccent.withOpacity(0.1),
            radius: 30,
            child: const Icon(Icons.download, color: Colors.greenAccent),
          ),
          title: const Text(
            "WALLET",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: const Text(
            "8 hours ago",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Text(
            "+ 10 rs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
