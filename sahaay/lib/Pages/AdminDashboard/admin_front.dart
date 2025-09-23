import 'package:flutter/material.dart';
import 'package:sahaay/Pages/AdminDashboard/admin_counselor.dart';
import 'package:sahaay/Pages/AdminDashboard/admin_overview.dart';
import 'package:sahaay/Pages/AdminDashboard/admin_policies.dart';
import 'package:sahaay/Pages/AdminDashboard/admin_profile.dart';
import 'package:sahaay/Pages/AdminDashboard/admin_trend.dart';

class AdminFront extends StatefulWidget {
  final String page;
  const AdminFront({super.key, required this.page});

  @override
  State<AdminFront> createState() => _AdminFrontState();
}

class _AdminFrontState extends State<AdminFront> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminOverview(),
    TrendsView(),
    CounselorWorkloadPage(),
    PoliciesView(),
    AdminProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
    if (widget.page == 'AdminOverview') {
      _selectedIndex = 0;
    } else if (widget.page == 'AdminTrends') {
      _selectedIndex = 1;
    } else if (widget.page == 'AdminCounsellors') {
      _selectedIndex = 2;
    } else if (widget.page == 'AdminPolicies') {
      _selectedIndex = 3;
    } else if (widget.page == 'AdminProfile') {
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
            _buildBottomNavItem(context, Icons.dashboard, 'Overview', 0),
            _buildBottomNavItem(context, Icons.trending_up, 'Trends', 1),
            _buildBottomNavItem(
              context,
              Icons.group_outlined,
              'Counsellors ',
              2,
            ),
            _buildBottomNavItem(
              context,
              Icons.lightbulb_outline,
              'Policies',
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
