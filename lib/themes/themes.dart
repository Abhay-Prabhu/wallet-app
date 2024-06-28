import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF4C4C4C);

const Color backgroundColor = Color.fromARGB(255, 23, 22, 22);

const Color container1 = Color(0xFFE3E3E1);

const Color textColor = Colors.white;

const Color buttonColor1 = Color(0xFFF24049);

const Color buttonColor2 = Color(0xFF007AFF);

const Color errorColor = Color(0xFFCF6679);


final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      surface: backgroundColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: backgroundColor,
    textTheme:const TextTheme(
      displayLarge: TextStyle(color: Colors.white) 
    ),
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor));
