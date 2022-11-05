import 'package:flutter/material.dart';
import 'package:step_counter/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1b1a1b),
          secondary: const Color(0xFF212121),
        ),
      ),
      home: const MainPage(),
    );
  }
}
