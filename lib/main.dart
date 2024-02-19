import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: MyColor.textColor,
            fontFamily: "GB",
            fontSize: 16,
          ),
          headlineMedium: TextStyle(
            fontFamily: "GR",
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: MyColor.textColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: "GM",
            color: MyColor.greyColor,
            fontSize: 12,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColor.buttonColor,
            foregroundColor: MyColor.textColor,
            textStyle: const TextStyle(
              fontFamily: "GB",
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: MyColor.greyColor,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
