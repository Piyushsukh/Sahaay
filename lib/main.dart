import 'package:flutter/material.dart';
import 'package:sahaay/Animation/logo_animation.dart';

void main() {
  runApp(const Sahaay());
}

class Sahaay extends StatelessWidget {
  const Sahaay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        fontFamily: 'PlayfairDisplay',
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: Color.fromARGB(255, 9, 111, 82),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 94, 139, 126)),
      ),
      home: SplashScreen(),
    );
  }
}
