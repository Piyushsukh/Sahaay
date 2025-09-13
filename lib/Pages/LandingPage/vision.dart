import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  const FlowPage({super.key});

  final List<Map<String, String>> steps = const [
    {
      "number": "1",
      "title": "Sign Up",
      "description": "Create your safe space in minutes",
      "icon": "🌱",
    },
    {
      "number": "2",
      "title": "Self-Check",
      "description": "Assess your wellbeing with guided tools",
      "icon": "🌸",
    },
    {
      "number": "3",
      "title": "Get Support",
      "description": "Connect with AI, peers, or counsellors",
      "icon": "✨",
    },
    {
      "number": "4",
      "title": "Grow & Reflect",
      "description": "Track your journey and celebrate progress",
      "icon": "🌿",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "From Stress to Support, Step by Step",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your wellness journey simplified into four meaningful steps",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.teal),
            ),
            const SizedBox(height: 30),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                return _buildStepCard(
                  step["number"]!,
                  step["title"]!,
                  step["description"]!,
                  step["icon"]!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(
    String number,
    String title,
    String description,
    String icon,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.teal.shade50,
                  child: Text(icon, style: const TextStyle(fontSize: 28)),
                ),
                Positioned(
                  right: -2,
                  top: -2,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.teal,
                    child: Text(
                      number,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
