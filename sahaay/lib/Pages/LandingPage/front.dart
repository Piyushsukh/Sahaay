import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahaay/Pages/LandingPage/home.dart';
import 'package:sahaay/Pages/LandingPage/problem.dart';
import 'package:sahaay/Pages/LandingPage/profile.dart';
import 'package:sahaay/Pages/LandingPage/stories.dart';
import 'package:sahaay/Pages/LandingPage/vision.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Home(),
    StoriesPage(),
    ProblemPage(),
    FlowPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    const Color mainGreen = Color.fromARGB(255, 9, 111, 82);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Sahaay'),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),

      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.house),
              color: _selectedIndex == 0 ? mainGreen : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.book),
              color: _selectedIndex == 1 ? mainGreen : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.triangleExclamation),
              color: _selectedIndex == 2 ? mainGreen : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.eye),
              color: _selectedIndex == 3 ? mainGreen : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.user),
              color: _selectedIndex == 4 ? mainGreen : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
