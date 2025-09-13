import 'package:flutter/material.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "The Silent Struggle in Campuses",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                color: Colors.orange.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/stressed-college-student-sitting-with-head-in-hand.jpg",
                        height: 180,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Students overwhelmed by academic pressure and lacking proper support channels",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildProblemCard(
              icon: Icons.warning_amber_rounded,
              title: "Rising Mental Health Concerns",
              description:
                  "Student stress and anxiety levels continue to climb across campuses worldwide.",
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildProblemCard(
              icon: Icons.person,
              title: "Underutilized Counselling Services",
              description:
                  "Many students avoid seeking help due to stigma and accessibility barriers.",
              color: Colors.purple,
            ),
            const SizedBox(height: 12),
            _buildProblemCard(
              icon: Icons.support_agent,
              title: "Lack of Centralized Support",
              description:
                  "Fragmented resources make it difficult for students to find the right help when needed.",
              color: Colors.teal,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProblemCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
