import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_app/themes/themes.dart';


class TextFieldWidget extends StatelessWidget {
  ///Custom Text Field
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final double height;
  final double width;

  const TextFieldWidget({
    Key? superkey,
    required this.controller,
    required this.labelText,
    required this.hintText,
     this.height = 50,
     this.width = 50,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            child: Center(
              child: TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: labelText,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.grey[400]), 
                  labelStyle: const TextStyle(
                      color: Colors.white),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                obscureText: obscureText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
