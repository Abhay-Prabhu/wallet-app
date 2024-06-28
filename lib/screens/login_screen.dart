import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/providers/login_provider.dart';
import 'package:wallet_app/screens/home_screen.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import 'package:wallet_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({super.key, Key? superkey}) ;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final result = await loginProvider.login(
      _usernameController.text,
      _passwordController.text,
    );

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', loginProvider.profile!.username.toString());
    prefs.setString(
      'imageUrl',
      loginProvider.profile!.profilePictureUrl.toString(),
    );

    if (result ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/wallet.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 60),
            TextFieldWidget(
              controller: _usernameController,
              height: 70,
              width: 400,
              labelText: "Username or Email",
              hintText: "example@gmail.com",
            ),
            const SizedBox(height: 60),
            TextFieldWidget(
              controller: _passwordController,
              height: 70,
              width: 400,
              labelText: "Password",
              hintText: "password",
              obscureText: true,
            ),
            const SizedBox(height: 60),
            CustomButton(
              textColor: textColor,
              text: "Login",
              color: primaryColor,
              height: 50,
              width: 100,
              onPressed: () {
                _login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
