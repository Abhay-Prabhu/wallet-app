import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/login_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access login provider to retrieve profile data
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                loginProvider.profile?.profilePictureUrl ?? '',
              ),
              //child: Text("${loginProvider.profile?.profilePictureUrl}"),
            ),
            const SizedBox(height: 20),
            Text(
              loginProvider.profile?.username ?? 'Username',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              loginProvider.profile?.email ?? 'Email not available',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1.5),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Followers",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
                Column(
                  children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Following",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
                Column(
                  children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Posts",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
