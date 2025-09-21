import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppointmentCard extends StatelessWidget {
  final String counselorName;
  final String specialty;
  final String details;
  final String date;
  final String time;
  final String meetingType;
  final String languages;
  final String status;

  const AppointmentCard({
    super.key,
    required this.counselorName,
    required this.specialty,
    required this.details,
    required this.date,
    required this.time,
    required this.meetingType,
    required this.languages,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Counselor Info
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        counselorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        specialty,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(
                    status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: status == "Confirmed"
                      ? Colors.green
                      : Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Details
            Text(details, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(date, style: const TextStyle(color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(time, style: const TextStyle(color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.video_call, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  meetingType,
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.language, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "Languages: $languages",
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Handle join session
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  icon: const Icon(
                    Icons.video_call,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text("Join Session"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Handle WhatsApp
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text("WhatsApp"),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Handle reschedule
                  },
                  icon: const Icon(Icons.schedule, size: 18),
                  label: const Text("Reschedule"),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.cancel, size: 18),
                  label: const Text("Cancel"),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
