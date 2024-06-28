import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  ///Custom Text Button
  final String text;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color:color,
        borderRadius:const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Center(child: Text(text, style: TextStyle(color:textColor),)),
      ),
    );
  }
}
