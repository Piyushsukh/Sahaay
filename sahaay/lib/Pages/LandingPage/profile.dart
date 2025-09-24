import 'package:flutter/material.dart';
import 'package:sahaay/Pages/AuthPage/log_in.dart';
import 'package:sahaay/Pages/AuthPage/sign_up.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildLoggedOutView(context),
        ),
      ),
    );
  }

  Widget _buildLoggedOutView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.teal,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text(
          "Welcome to Sahaay",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Login or Sign Up to track your wellness journey",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Login"),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SignupPage()));
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.teal),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Sign Up", style: TextStyle(color: Colors.teal)),
        ),
      ],
    );
  }
}
