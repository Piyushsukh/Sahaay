import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaay/Widgets/progress_indicator.dart';
import 'package:sahaay/Widgets/recently_active_item.dart';
import 'package:sahaay/main.dart';
import 'package:sahaay/widgets/feature_card.dart';
import 'package:sahaay/widgets/appointment_card.dart';

class StDashboard extends StatelessWidget {
  const StDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildDailyMotivation(context),
            const SizedBox(height: 16),
            _buildFeatureCards(),
            const SizedBox(height: 16),
            _buildProgressSection(),
            const SizedBox(height: 16),
            _buildRecentActivity(),
            const SizedBox(height: 16),
            _buildUpcomingAppointments(context),
            const SizedBox(height: 16),
            _buildCrisisSupportBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Consumer(
      builder: (context, ref, child) => Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good evening, ${ref.watch(nameProvider)}!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Sunday, September 14, 2025',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              const Text(
                'Welcome to your mental wellness journey. How are you feeling today?',
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Icon(
                    _getMoodIcon(ref.watch(moodProvider)),
                    size: 36,
                    color: _getMoodColor(ref.watch(moodProvider)),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current Mood",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        ref.watch(moodProvider),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Last updated: 11:24 PM",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  _showMoodDialog(context, ref);
                },
                child: const Text("Update Mood"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoodDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select your mood"),
          content: Wrap(
            spacing: 12,
            children: [
              _moodEmoji(context, ref, "Happy", "😊"),
              _moodEmoji(context, ref, "Sad", "😢"),
              _moodEmoji(context, ref, "Neutral", "😐"),
              _moodEmoji(context, ref, "Angry", "😡"),
              _moodEmoji(context, ref, "Excited", "🤩"),
            ],
          ),
        );
      },
    );
  }

  Widget _moodEmoji(
    BuildContext context,
    WidgetRef ref,
    String mood,
    String emoji,
  ) {
    return GestureDetector(
      onTap: () {
        ref.read(moodProvider.notifier).state = mood;
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          Text(mood, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static IconData _getMoodIcon(String mood) {
    switch (mood) {
      case "Happy":
        return Icons.sentiment_satisfied;
      case "Sad":
        return Icons.sentiment_dissatisfied;
      case "Angry":
        return Icons.sentiment_very_dissatisfied;
      case "Excited":
        return Icons.emoji_emotions;
      default:
        return Icons.sentiment_neutral;
    }
  }

  static Color _getMoodColor(String mood) {
    switch (mood) {
      case "Happy":
        return Colors.green;
      case "Sad":
        return Colors.blue;
      case "Angry":
        return Colors.red;
      case "Excited":
        return Colors.purple;
      default:
        return Colors.orange;
    }
  }
}

Widget _buildDailyMotivation(BuildContext context) {
  return Card(
    color: Colors.green[50],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(Icons.star_border, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Asking for help is a sign of strength, not weakness.',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildFeatureCards() {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      InkWell(
        onTap: () {},
        child: FeatureCard(
          icon: Icons.assignment_outlined,
          title: 'Self Assessment',
          subtitle: 'Take PHQ-9 or GAD-7 questionnaires',
          tag: 'Weekly',
        ),
      ),
      InkWell(
        onTap: () {},
        child: FeatureCard(
          icon: Icons.support_agent_outlined,
          title: 'AI Support Chat',
          subtitle: 'Get instant guidance',
          tag: '24/7',
        ),
      ),
      InkWell(
        onTap: () {},
        child: FeatureCard(
          icon: Icons.calendar_today_outlined,
          title: 'Book Session',
          subtitle: 'Schedule with counselor',
          tag: 'Available',
        ),
      ),
      InkWell(
        onTap: () {},
        child: FeatureCard(
          icon: Icons.book_outlined,
          title: 'Digital Journal',
          subtitle: 'Record your thoughts',
          tag: 'Private',
        ),
      ),
    ],
  );
}

Widget _buildProgressSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Your Progress',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      ProgressIndicatorCard(
        title: 'Mood Tracking',
        progress: 0.4,
        completed: '12/30 days',
        remaining: '18 more to go',
        color: Colors.blue,
      ),
      SizedBox(height: 12),
      ProgressIndicatorCard(
        title: 'Journal Entries',
        progress: 0.53,
        completed: '8/15 entries',
        remaining: '7 more to go',
        color: Colors.green,
      ),
      SizedBox(height: 12),
      ProgressIndicatorCard(
        title: 'Counseling Sessions',
        progress: 0.5,
        completed: '3/6 sessions',
        remaining: '3 more to go',
        color: Colors.purple,
      ),
      SizedBox(height: 12),
      ProgressIndicatorCard(
        title: 'Self Assessments',
        progress: 0.5,
        completed: '2/4 completed',
        remaining: '2 more to go',
        color: Colors.orange,
      ),
    ],
  );
}

Widget _buildRecentActivity() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Recent Activity',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      RecentlyActiveItem(
        icon: Icons.book_outlined,
        title: 'Morning Reflection',
        description: 'Wrote about optimism after good sleep.',
        time: '2 hours ago',
      ),
      Divider(),
      RecentlyActiveItem(
        icon: Icons.mood_outlined,
        title: 'Mood Check-in',
        description: 'Feeling positive about presentation.',
        time: '4 hours ago',
      ),
      Divider(),
      RecentlyActiveItem(
        icon: Icons.assignment_outlined,
        title: 'PHQ-9 Assessment',
        description: 'Completed weekly depression screening.',
        time: '1 day ago',
      ),
      Divider(),
      RecentlyActiveItem(
        icon: Icons.support_agent_outlined,
        title: 'Counseling Session',
        description: 'Had a productive session with Dr. Sarah.',
        time: '2 days ago',
      ),
    ],
  );
}

Widget _buildUpcomingAppointments(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Upcoming Appointments',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12),
      AppointmentCard(
        counselorName: 'Dr. Rajesh Kumar',
        specialty: 'Family & Career Counselor',
        details: 'Career vs Family Expectations',
        date: 'Friday 19 Sept',
        time: '10:30 AM (45 min)',
        meetingType: 'Virtual Meeting (Google Meet)',
        languages: 'Hindi, English, Marathi',
        status: 'Confirmed',
      ),
      SizedBox(height: 12),
      AppointmentCard(
        counselorName: 'Dr. Meera Reddy',
        specialty: 'Crisis Intervention Specialist',
        details: 'Anxiety & Depression Support',
        date: 'Sunday 21 Sept',
        time: '4:30 PM (60 min)',
        meetingType: 'Emergency Support Session',
        languages: 'Telugu, English, Hindi, Kannada',
        status: 'Pending',
      ),
    ],
  );
}

Widget _buildCrisisSupportBanner() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFFEE8EC),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.favorite, color: Colors.red),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Need Immediate Support? Crisis support is available 24/7.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC70039),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, color: Color(0xFFC70039)),
                label: const Text(
                  'Call 14416',
                  style: TextStyle(color: Color(0xFFC70039)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Chat Now',
                  style: TextStyle(color: Color(0xFFC70039)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
