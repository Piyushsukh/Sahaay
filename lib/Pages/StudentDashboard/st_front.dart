import 'package:flutter/material.dart';
import 'package:sahaay/Pages/StudentDashboard/st_aisupport.dart';
import 'package:sahaay/Pages/StudentDashboard/st_book.dart';
import 'package:sahaay/Pages/StudentDashboard/st_dashboard.dart';
import 'package:sahaay/Pages/StudentDashboard/st_journal.dart';
import 'package:sahaay/Pages/StudentDashboard/st_profile.dart';

class StFront extends StatefulWidget {
  final String page;
  const StFront({super.key, required this.page});

  @override
  State<StFront> createState() => _StFrontState();
}

class _StFrontState extends State<StFront> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    StDashboard(),
    StJournal(),
    StAisupport(),
    StBook(),
    StProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
    if (widget.page == 'StDashboard') {
      _selectedIndex = 0;
    } else if (widget.page == 'StJournal') {
      _selectedIndex = 1;
    } else if (widget.page == 'StAisupport') {
      _selectedIndex = 2;
    } else if (widget.page == 'StBook') {
      _selectedIndex = 3;
    } else if (widget.page == 'StProfile') {
      _selectedIndex = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 32),
            const SizedBox(width: 8),
            const Text(
              'Sahaay',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(context, Icons.dashboard, 'Dashboard', 0),
            _buildBottomNavItem(context, Icons.book, 'Journal', 1),
            _buildBottomNavItem(
              context,
              Icons.support_agent_outlined,
              'AI Support',
              2,
            ),
            _buildBottomNavItem(
              context,
              Icons.calendar_today_outlined,
              'Book',
              3,
            ),
            _buildBottomNavItem(context, Icons.person_outline, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    final bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey[600],
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
