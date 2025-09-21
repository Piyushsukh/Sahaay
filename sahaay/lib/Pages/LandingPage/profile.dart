import 'package:flutter/material.dart';
import 'package:sahaay/Pages/AuthPage/log_in.dart';
import 'package:sahaay/Pages/AuthPage/sign_up.dart';

class ProfilePage extends StatelessWidget {
  final bool isLoggedIn;
  final String? userName;
  final String? userEmail;

  const ProfilePage({
    super.key,
    this.isLoggedIn = false,
    this.userName,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isLoggedIn
              ? _buildLoggedInView()
              : _buildLoggedOutView(context),
        ),
      ),
    );
  }

  /// View when NOT logged in
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

  /// View when logged in
  Widget _buildLoggedInView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.teal.shade200,
          child: const Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          userName ?? "User",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          userEmail ?? "user@example.com",
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(Icons.bar_chart, color: Colors.teal),
          title: const Text("My Journey"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.teal),
          title: const Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text("Logout"),
          onTap: () {},
        ),
      ],
    );
  }
}
