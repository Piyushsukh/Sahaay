import 'package:flutter/material.dart';

class StBook extends StatelessWidget {
  final List<Counselor> counselors = const [
    Counselor(
      name: "Dr. Rajesh Kumar",
      title: "Licensed Marriage & Family Therapist",
      experience: 12,
      rating: 4.8,
      reviewCount: 203,
      location: "Mental Health Center, IIT Mumbai",
      specializations: [
        "Family Pressure",
        "Career vs Parents' Expectations",
        "Identity Crisis",
      ],
      available: false,
      availabilityText: "Limited Availability",
      profileImage: "https://randomuser.me/api/portraits/men/32.jpg",
    ),
    Counselor(
      name: "Dr. Amit Patel",
      title: "Licensed Professional Counselor",
      experience: 10,
      rating: 4.9,
      reviewCount: 156,
      location: "Student Health Services, JNU Delhi",
      specializations: [
        "Body Image Issues",
        "Social Media Pressure",
        "Perfectionism",
      ],
      available: true,
      availabilityText: "Available Today",
      profileImage: "https://randomuser.me/api/portraits/men/45.jpg",
    ),
    Counselor(
      name: "Dr. Kavitha Nair",
      title: "Psychiatric Nurse Practitioner",
      experience: 15,
      rating: 4.8,
      reviewCount: 178,
      location: "Mental Health Clinic, NIMHANS Bangalore",
      specializations: ["Medication Management", "Bipolar Disorder", "ADHD"],
      available: false,
      availabilityText: "Fully Booked",
      profileImage: "https://randomuser.me/api/portraits/women/65.jpg",
    ),
    Counselor(
      name: "Dr. Neha Singh",
      title: "Clinical Psychologist",
      experience: 8,
      rating: 4.7,
      reviewCount: 120,
      location: "Wellness Center, Delhi University",
      specializations: ["Anxiety", "Stress Management", "Self-esteem"],
      available: true,
      availabilityText: "Available Today",
      profileImage: "https://randomuser.me/api/portraits/women/22.jpg",
    ),
    Counselor(
      name: "Dr. Vikram Sharma",
      title: "Licensed Counselor",
      experience: 9,
      rating: 4.6,
      reviewCount: 90,
      location: "Mental Health Clinic, Pune",
      specializations: ["Addiction", "Depression", "Sleep Issues"],
      available: false,
      availabilityText: "Limited Availability",
      profileImage: "https://randomuser.me/api/portraits/men/56.jpg",
    ),
    Counselor(
      name: "Dr. Priya Menon",
      title: "Psychotherapist",
      experience: 11,
      rating: 4.9,
      reviewCount: 140,
      location: "Healing Minds, Chennai",
      specializations: ["Relationship Issues", "Grief", "Anger Management"],
      available: true,
      availabilityText: "Available Today",
      profileImage: "https://randomuser.me/api/portraits/women/35.jpg",
    ),
    Counselor(
      name: "Dr. Rahul Verma",
      title: "Counseling Psychologist",
      experience: 7,
      rating: 4.5,
      reviewCount: 110,
      location: "Mental Wellness Clinic, Hyderabad",
      specializations: ["Career Counseling", "Motivation", "Work Stress"],
      available: true,
      availabilityText: "Available Today",
      profileImage: "https://randomuser.me/api/portraits/men/28.jpg",
    ),
  ];

  const StBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Book Your Counseling Session",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Connect with licensed mental health professionals who understand the unique challenges of Indian student life. Your wellbeing is our priority.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 36),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search counselors by name or specialization...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "7 counselors available",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 12),
            ...counselors.map((c) => CounselorCard(counselor: c)),
          ],
        ),
      ),
    );
  }
}

class Counselor {
  final String name;
  final String title;
  final int experience;
  final double rating;
  final int reviewCount;
  final String location;
  final List<String> specializations;
  final bool available;
  final String availabilityText;
  final String profileImage;

  const Counselor({
    required this.name,
    required this.title,
    required this.experience,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.specializations,
    required this.available,
    required this.availabilityText,
    required this.profileImage,
  });
}

class CounselorCard extends StatelessWidget {
  final Counselor counselor;
  const CounselorCard({super.key, required this.counselor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(counselor.profileImage),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        counselor.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        counselor.title,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.school, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "${counselor.experience} years experience",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            "${counselor.rating} (${counselor.reviewCount} reviews)",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              counselor.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      counselor.availabilityText,
                      style: TextStyle(
                        color: counselor.available
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: counselor.available ? () {} : null,
                      icon: Icon(Icons.calendar_today),
                      label: Text("Book Session"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: counselor.available
                            ? Colors.green[300]
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Specializations:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Wrap(
              spacing: 8,
              children: counselor.specializations
                  .map(
                    (spec) =>
                        Chip(label: Text(spec, style: TextStyle(fontSize: 12))),
                  )
                  .toList(),
            ),
            SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person),
              label: Text("View Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
