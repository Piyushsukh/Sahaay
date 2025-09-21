import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sahaay/Pages/StudentDashboard/chat.dart';
import 'package:sahaay/Pages/StudentDashboard/st_front.dart';

// AI Support Screen UI based on the image
class StAisupport extends StatelessWidget {
  const StAisupport({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          // AI icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.psychology_outlined,
              color: Colors.blue.shade800,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          // Welcome text
          Text(
            'Welcome to AI Support',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "I'm here to provide you with mental health support and guidance whenever you need it.",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          // Feature cards grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
            children: const [
              _AiFeatureCard(
                title: '24/7 Support',
                description: 'Get instant mental health guidance anytime',
                icon: Icons.support_agent_outlined,
              ),
              _AiFeatureCard(
                title: 'Private & Secure',
                description:
                    'Your conversations are confidential and encrypted',
                icon: Icons.lock_outlined,
              ),
              _AiFeatureCard(
                title: 'Empathetic AI',
                description:
                    'Trained to provide compassionate mental health support',
                icon: Icons.favorite_border,
              ),
              _AiFeatureCard(
                title: 'Human Connection',
                description:
                    'Easy escalation to professional counselors when needed',
                icon: Icons.person_add_alt_outlined,
              ),
            ],
          ),
          const SizedBox(height: 48),
          // "Start Conversation" button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AiChatPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Start Conversation',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () async {
              await FlutterPhoneDirectCaller.callNumber('8381836793');
            },
            icon: const Icon(Icons.call_outlined, color: Colors.green),
            label: const Text('Ai Call Support'),
          ),

          const SizedBox(height: 32),
          // Other options
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StFront(page: 'StBook'),
                ),
              );
            },
            icon: const Icon(Icons.event_note_outlined),
            label: const Text('Book Counselor Session'),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StFront(page: 'StDashboard'),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_outlined),
            label: const Text('Back to Dashboard'),
          ),
          const SizedBox(height: 32),
          // Important Notice Card
          Card(
            color: const Color(0xFFFFF3E0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFFE65100)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Important Notice',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE65100),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'This AI assistant provides support and guidance but is not a replacement for professional mental health care. In case of emergency, please contact crisis services immediately.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A reusable card for the AI features
class _AiFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _AiFeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
