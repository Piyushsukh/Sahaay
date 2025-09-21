import 'package:flutter/material.dart';

class ProgressIndicatorCard extends StatelessWidget {
  final String title;
  final double progress;
  final String completed;
  final String remaining;
  final Color color;

  const ProgressIndicatorCard({
    super.key,
    required this.title,
    required this.progress,
    required this.completed,
    required this.remaining,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: color,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 12),
            Text(
              completed,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
            Text(
              remaining,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
