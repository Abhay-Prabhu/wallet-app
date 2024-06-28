import 'package:flutter/material.dart';
import 'package:wallet_app/screens/home_screen.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import 'package:wallet_app/widgets/custom_text_field.dart'; 

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController networksController = TextEditingController();

    return AlertDialog(
        title: const Text('Create Wallet'),
        content: SizedBox(
          width: 300, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const Text("Username:"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFieldWidget(
                      width: 80,
                      controller: usernameController,
                      height: 60,
                      hintText: "user1",
                      labelText: "Enter username",
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const Text("Password:"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFieldWidget(
                      width: 80,
                      controller: passwordController,
                      height: 60,
                      hintText: "password",
                      labelText: "Enter password",
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const Text("Network:"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFieldWidget(
                      width: 80,
                      controller: networksController,
                      height: 60,
                      hintText: "Devnet",
                      labelText: "Enter network",
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        actions: [
          CustomButton(
            color: primaryColor,
            height: 50,
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Cancel',
            textColor: Colors.white,
            width: 70,
          ),
          CustomButton(
            color: primaryColor,
            height: 50,
            onPressed: () {
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>const HomeScreen()));
            },
            text: 'Create',
            textColor: Colors.white,
            width: 70,
          )
        ]);
  }
}
