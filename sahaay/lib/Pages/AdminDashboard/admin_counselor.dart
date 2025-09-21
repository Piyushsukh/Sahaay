import 'package:flutter/material.dart';

class CounselorWorkloadPage extends StatelessWidget {
  final List<Counselor> counselors = [
    Counselor(
      name: "Dr. Sarah Johnson",
      specialty: "Anxiety & Depression",
      weeklyHours: 32,
      avgSessionMinutes: 52,
      riskCases: 3,
      nextAvailable: DateTime(2025, 9, 13, 10, 0),
      rating: 4.8,
      students: 28,
      maxStudents: 35,
      status: CounselorStatus.available,
    ),
    Counselor(
      name: "Dr. Michael Chen",
      specialty: "Academic Stress",
      weeklyHours: 35,
      avgSessionMinutes: 48,
      riskCases: 2,
      nextAvailable: DateTime(2025, 9, 16, 14, 0),
      rating: 4.6,
      students: 35,
      maxStudents: 35,
      status: CounselorStatus.atCapacity,
    ),
    Counselor(
      name: "Dr. Emily Rodriguez",
      specialty: "Trauma & PTSD",
      weeklyHours: 28,
      avgSessionMinutes: 58,
      riskCases: 5,
      nextAvailable: DateTime(2025, 9, 14, 11, 0),
      rating: 4.9,
      students: 22,
      maxStudents: 30,
      status: CounselorStatus.available,
    ),
  ];

  CounselorWorkloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle
              ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          title: const Text('Counselor Workload Management'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Performance'),
              Tab(text: 'Assignments'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOverviewTab(),
            _buildPerformanceTab(),
            _buildAssignmentsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: counselors.length,
      itemBuilder: (context, index) {
        final c = counselors[index];
        double progress = c.students / c.maxStudents;
        Color progressColor = c.status == CounselorStatus.available
            ? Colors.orange
            : Colors.red;
        String statusText = c.status == CounselorStatus.available
            ? "AVAILABLE"
            : "AT CAPACITY";

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            c.specialty,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: c.status == CounselorStatus.available
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  color: progressColor,
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatColumn('${c.weeklyHours}h', 'Weekly Hours'),
                    _buildStatColumn('${c.avgSessionMinutes}m', 'Avg Session'),
                    _buildStatColumn('${c.riskCases}', 'Risk Cases'),
                    _buildStatColumn(
                      '${c.nextAvailable.month}-${c.nextAvailable.day} ${c.nextAvailable.hour}:${c.nextAvailable.minute.toString().padLeft(2, '0')}',
                      'Next Available',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(Icons.calendar_today, 'View Schedule'),
                    _buildActionButton(Icons.chat, 'Contact'),
                    _buildActionButton(Icons.person_add, 'Assign Student'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPerformanceTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              PerformanceStat(label: "Avg Satisfaction", value: "4.7"),
              PerformanceStat(label: "Avg Session Length", value: "53m"),
              PerformanceStat(label: "High-Risk Cases", value: "16"),
            ],
          ),
          SizedBox(height: 20),

          // Counselors List
          Expanded(
            child: ListView(
              children: const [
                CounselorCard(
                  name: "Dr. Sarah Johnson",
                  details:
                      "Excellent rapport with students, very effective with CBT techniques.",
                  avgSession: "52min avg session",
                  rating: "4.8",
                  riskCases: "3 high-risk cases",
                ),
                CounselorCard(
                  name: "Dr. Michael Chen",
                  details:
                      "Great with exam anxiety cases, students respond well to his approach.",
                  avgSession: "48min avg session",
                  rating: "4.6",
                  riskCases: "2 high-risk cases",
                ),
                CounselorCard(
                  name: "Dr. Emily Rodriguez",
                  details:
                      "Exceptional with trauma cases, highly recommended by peer counselors.",
                  avgSession: "58min avg session",
                  rating: "4.9",
                  riskCases: "5 high-risk cases",
                ),
                CounselorCard(
                  name: "Dr. James Wilson",
                  details:
                      "Strong expertise in addiction counseling, good crisis intervention skills.",
                  avgSession: "55min avg session",
                  rating: "4.4",
                  riskCases: "4 high-risk cases",
                ),
                CounselorCard(
                  name: "Dr. Lisa Thompson",
                  details:
                      "Expertise in eating disorders, effective therapy outcomes.",
                  avgSession: "54min avg session",
                  rating: "4.7",
                  riskCases: "2 high-risk cases",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  "Manage student-counselor assignments and workload distribution",
                  softWrap: true,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  overflow: TextOverflow.visible,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                label: const Text(
                  "New Assignment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 🔹 Grid of Counselors
          Expanded(
            child: ListView.builder(
              itemCount: counselors.length,
              itemBuilder: (context, index) =>
                  _assignmentCard(counselors[index]),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Assignment Card Widget
  Widget _assignmentCard(Counselor c) {
    int availableSlots = c.maxStudents - c.students;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            c.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(c.specialty, style: const TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  fixedSize: Size(160, 5),
                  overlayColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                ),
                child: Text("📅 View Availability"),
              ),
              Text(
                "$availableSlots slots",
                style: TextStyle(
                  color: availableSlots > 3 ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              fixedSize: Size(160, 5),
              overlayColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            child: Text("👥 Current Students"),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 10),
      label: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}

enum CounselorStatus { available, atCapacity }

class Counselor {
  final String name;
  final String specialty;
  final int weeklyHours;
  final int avgSessionMinutes;
  final int riskCases;
  final DateTime nextAvailable;
  final double rating;
  final int students;
  final int maxStudents;
  final CounselorStatus status;

  Counselor({
    required this.name,
    required this.specialty,
    required this.weeklyHours,
    required this.avgSessionMinutes,
    required this.riskCases,
    required this.nextAvailable,
    required this.rating,
    required this.students,
    required this.maxStudents,
    required this.status,
  });
}

class PerformanceStat extends StatelessWidget {
  final String label;
  final String value;
  const PerformanceStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// 🔹 Card widget for counselor info
class CounselorCard extends StatelessWidget {
  final String name;
  final String details;
  final String avgSession;
  final String rating;
  final String riskCases;

  const CounselorCard({
    super.key,
    required this.name,
    required this.details,
    required this.avgSession,
    required this.rating,
    required this.riskCases,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name + Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 4),
                    Text(rating),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(details, style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 6),
            Text(avgSession, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 6),
            Text(riskCases, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
