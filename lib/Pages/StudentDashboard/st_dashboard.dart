// The main dashboard page widget
import 'package:flutter/material.dart';

class StDashboard extends StatelessWidget {
  const StDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header and navigation bar
              _buildHeader(context),
              const SizedBox(height: 24),
              // Main content layout with two columns
              _buildMainContent(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildCrisisSupportBanner(),
    );
  }

  // --- Widget Builders for each section ---

  Widget _buildHeader(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 1000;

    if (isSmallScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              const Icon(Icons.menu), // Hamburger menu for small screens
            ],
          ),
          const SizedBox(height: 16),
          // Navigation tabs can be in a scrollable row or a column on small screens
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildLogo(), _buildHeaderTabs()],
      );
    }
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.network(
          'https://placehold.co/40x40/E5F1E5/006400?text=S',
          height: 40,
        ),
        const SizedBox(width: 8),
        const Text(
          'Sahaay',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHeaderTabs() {
    return Row(
      children: [
        _buildHeaderTab('Dashboard', Icons.dashboard),
        _buildHeaderTab('Journal', Icons.book_outlined),
        _buildHeaderTab('AI Support', Icons.chat_bubble_outline),
        _buildHeaderTab('Book Session', Icons.calendar_today_outlined),
        _buildHeaderTab('Crisis Support', Icons.error_outline, isCrisis: true),
        _buildHeaderTab('Student Portal', Icons.school),
        const Icon(Icons.person_outline),
      ],
    );
  }

  Widget _buildHeaderTab(String title, IconData icon, {bool isCrisis = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: isCrisis
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.red),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Icon(icon, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(title, style: TextStyle(color: Colors.grey.shade800)),
              ],
            ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 1000;

    if (isSmallScreen) {
      return Column(
        children: [
          _buildGreetingCard(),
          const SizedBox(height: 24),
          _buildDailyMotivation(),
          const SizedBox(height: 24),
          _buildFeatureGrid(context),
          const SizedBox(height: 24),
          _buildYourProgressSection(),
          const SizedBox(height: 24),
          _buildRecentActivitySection(),
          const SizedBox(height: 24),
          _buildUpcomingAppointments(),
          const SizedBox(height: 24),
          _buildResourceHubAndForum(),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGreetingCard(),
                const SizedBox(height: 24),
                _buildDailyMotivation(),
                const SizedBox(height: 24),
                _buildFeatureGrid(context),
                const SizedBox(height: 24),
                _buildYourProgressSection(),
                const SizedBox(height: 24),
                _buildRecentActivitySection(),
                const SizedBox(height: 24),
                _buildResourceHubAndForum(),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 1,
            child: Column(children: [_buildUpcomingAppointments()]),
          ),
        ],
      );
    }
  }

  Widget _buildGreetingCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Good evening, Alex!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Monday, September 14, 2025',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to your mental wellness journey. How are you feeling today?',
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Current Mood',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Neutral',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Image.network(
                        'https://placehold.co/30x30/FFFFFF/000000?text=%F0%9F%99%84',
                        height: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Last updated: 11:24 PM',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Update Mood',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyMotivation() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            const Icon(Icons.star, color: Colors.green),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Motivation',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Asking for help is a sign of strength, not weakness.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 2;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.9,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _FeatureCard(
          title: 'Self Assessment',
          subtitle: 'Take PHQ-9 or GAD-7 questionnaire',
          icon: Icons.assignment_outlined,
          label: 'Weekly',
          iconColor: Colors.blue.shade300,
        ),
        _FeatureCard(
          title: 'AI Support Chat',
          subtitle: 'Get instant mental health guidance',
          icon: Icons.chat_bubble_outline,
          label: '24/7',
          iconColor: Colors.purple.shade300,
        ),
        _FeatureCard(
          title: 'Book Session',
          subtitle: 'Schedule with a counselor',
          icon: Icons.calendar_today_outlined,
          label: 'Available',
          iconColor: Colors.green.shade300,
        ),
        _FeatureCard(
          title: 'Digital Journal',
          subtitle: 'Record your thoughts and feelings',
          icon: Icons.auto_stories_outlined,
          label: 'Private',
          iconColor: Colors.orange.shade300,
        ),
      ],
    );
  }

  Widget _buildYourProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Progress',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'This Month',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Column(
                children: [
                  _buildProgressItem(
                    'Mood Tracking',
                    '12/30 days',
                    0.4,
                    Colors.blue,
                  ),
                  const SizedBox(height: 16),
                  _buildProgressItem(
                    'Journal Entries',
                    '8/15 entries',
                    0.53,
                    Colors.green,
                  ),
                  const SizedBox(height: 16),
                  _buildProgressItem(
                    'Counseling Sessions',
                    '3/6 sessions',
                    0.5,
                    Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  _buildProgressItem(
                    'Self Assessments',
                    '2/4 completed',
                    0.5,
                    Colors.orange,
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildProgressItem(
                          'Mood Tracking',
                          '12/30 days',
                          0.4,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildProgressItem(
                          'Journal Entries',
                          '8/15 entries',
                          0.53,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProgressItem(
                          'Counseling Sessions',
                          '3/6 sessions',
                          0.5,
                          Colors.purple,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildProgressItem(
                          'Self Assessments',
                          '2/4 completed',
                          0.5,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildProgressItem(
    String title,
    String count,
    double value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(count, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade200,
            color: color,
            borderRadius: BorderRadius.circular(10),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        const SizedBox(height: 16),
        _buildActivityItem(
          icon: Icons.description_outlined,
          title: 'Morning Reflection',
          description:
              'Wrote about feeling more optimistic today after a good night\'s sleep.',
          time: '2 hours ago',
          iconColor: Colors.blue.shade300,
        ),
        _buildActivityItem(
          icon: Icons.favorite_border,
          title: 'Mood Check-in',
          description:
              'Recorded mood as "Good" - feeling positive about upcoming presentation.',
          time: '4 hours ago',
          iconColor: Colors.green.shade300,
        ),
        _buildActivityItem(
          icon: Icons.assessment_outlined,
          title: 'PHQ-9 Assessment',
          description:
              'Completed weekly depression screening - scores showing improvement.',
          time: '1 day ago',
          iconColor: Colors.purple.shade300,
        ),
        _buildActivityItem(
          icon: Icons.people_outline,
          title: 'Counseling Session',
          description:
              'Had a productive session with Dr. Sarah about stress management techniques.',
          time: '2 days ago',
          iconColor: Colors.orange.shade300,
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String description,
    required String time,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            time,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceHubAndForum() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildResourceHub(),
              const SizedBox(height: 24),
              _buildPeerSupportForum(),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _buildResourceHub()),
              const SizedBox(width: 24),
              Expanded(flex: 1, child: _buildPeerSupportForum()),
            ],
          );
        }
      },
    );
  }

  Widget _buildResourceHub() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resource Hub',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildResourceItem(
          '5-Minute Morning Meditation',
          'https://placehold.co/150x90/D6E7EF/000000?text=Audio',
        ),
        _buildResourceItem(
          'Understanding Anxiety',
          'https://placehold.co/150x90/F9E0E0/000000?text=Video',
        ),
        _buildResourceItem(
          'Sleep Stories for Adults',
          'https://placehold.co/150x90/E5F1E5/000000?text=Audio',
        ),
        _buildResourceItem(
          'Breathing Exercises',
          'https://placehold.co/150x90/F9E0F9/000000?text=Guide',
        ),
        _buildResourceItem(
          'Building Healthy Habits',
          'https://placehold.co/150x90/E0F9F9/000000?text=Article',
        ),
      ],
    );
  }

  Widget _buildResourceItem(String title, String imageUrl) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Subtitle here...',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeerSupportForum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Peer Support Forum',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildForumThread(
          'Dealing with exam anxiety - tips that actually work',
          '3h ago',
        ),
        _buildForumThread(
          'Finding motivation when everything feels overwhelming',
          '6h ago',
        ),
        _buildForumThread(
          'Healthy sleep habits that changed my life',
          '12h ago',
        ),
      ],
    );
  }

  Widget _buildForumThread(String title, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(time, style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Appointments',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          name: 'Dr. Rajesh Kumar',
          specialty: 'Family & Career Counselor',
          status: 'Confirmed',
          date: 'Saturday 20 Sept',
          time: '10:30 AM (45 min)',
          isConfirmed: true,
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          name: 'Dr. Meera Reddy',
          specialty: 'Crisis Intervention Specialist',
          status: 'Pending',
          date: 'Sunday 21 Sept',
          time: '4:30 PM (60 min)',
          isConfirmed: false,
        ),
      ],
    );
  }

  Widget _buildAppointmentCard({
    required String name,
    required String specialty,
    required String status,
    required String date,
    required String time,
    required bool isConfirmed,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://placehold.co/40x40/E5F1E5/006400?text=${name.substring(name.indexOf(' ') + 1, name.indexOf(' ') + 2)}',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              specialty,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(status),
                  backgroundColor: isConfirmed
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                  labelStyle: TextStyle(
                    color: isConfirmed
                        ? Colors.green.shade800
                        : Colors.orange.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(date, style: TextStyle(color: Colors.grey.shade800)),
                const Spacer(),
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(time, style: TextStyle(color: Colors.grey.shade800)),
              ],
            ),
            const SizedBox(height: 16),
            if (isConfirmed)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text('Join Session'),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: const Text('Reschedule')),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCrisisSupportBanner() {
    return Container(
      color: Colors.red.shade800,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need Immediate Support?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Crisis support is available 24/7. You\'re not alone.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Call 14416',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String label;
  final Color iconColor;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Chip(
                label: Text(label),
                backgroundColor: iconColor.withOpacity(0.1),
                labelStyle: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            const Spacer(),
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Colors.blue.shade800,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
