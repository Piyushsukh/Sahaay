import 'package:flutter/material.dart';
import 'package:sahaay/Pages/LandingPage/front.dart';

class StProfile extends StatefulWidget {
  const StProfile({super.key});

  @override
  State<StProfile> createState() => _StProfileState();
}

class _StProfileState extends State<StProfile> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController(
    text: "Piyush Sukhwani",
  );
  final TextEditingController emailController = TextEditingController(
    text: "piyush@college.edu",
  );
  final TextEditingController branchController = TextEditingController(
    text: "Computer Science",
  );
  final TextEditingController yearController = TextEditingController(
    text: "3rd Year",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() => isEditing = !isEditing);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg",
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Welcome back!",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),

            buildTextField("Full Name", nameController, isEditing),
            buildTextField("Email", emailController, isEditing),
            buildTextField("Branch", branchController, isEditing),
            buildTextField("Year", yearController, isEditing),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatCard("Journal Entries", "12"),
                buildStatCard("Sessions Booked", "5"),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => FrontPage()),
                  (r) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                _confirmDelete(context);
              },
              icon: const Icon(Icons.delete_forever),
              label: const Text("Delete Account Permanently"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller,
    bool editable,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        enabled: editable,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildStatCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
          "Are you sure you want to delete your account permanently? "
          "This action cannot be undone.",
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Account deleted permanently."),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
