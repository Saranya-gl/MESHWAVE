import 'package:fishbook/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Page',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFF9D8C5),
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color(0xFF269493),
        ),
      ),
      home: homepage(),
    );
  }
}
