import 'package:flutter/material.dart';

class StJournal extends StatefulWidget {
  const StJournal({super.key});

  @override
  State<StJournal> createState() => _StJournalState();
}

class _StJournalState extends State<StJournal> {
  String selectedMood = "Neutral";
  String selectedFilter = "All"; // ✅ Track which filter is selected
  final TextEditingController _entryController = TextEditingController();

  final List<Map<String, String>> journalEntries = [];

  void saveEntry() {
    if (_entryController.text.trim().isEmpty) return;

    setState(() {
      journalEntries.add({
        "mood": selectedMood,
        "text": _entryController.text.trim(),
      });
      _entryController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal Section (Beta)"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daily Journal card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daily Journal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Write your thoughts and feelings. Only you can see this unless you choose to share.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    const Text("How are you feeling?"),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        moodChip("Happy", "😊"),
                        moodChip("Okay", "🙂"),
                        moodChip("Neutral", "😐"),
                        moodChip("Sad", "😢"),
                        moodChip("Down", "😞"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("Your entry"),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _entryController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Type anything that’s on your mind...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: saveEntry,
                      icon: const Icon(Icons.save),
                      label: const Text("Save Entry"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tips box
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tips",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("• Write freely — there’s no right or wrong."),
                    Text("• Capture your mood to see patterns over time."),
                    Text(
                      "• Share specific entries if you want counselor feedback.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Search & Filter section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search entries...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: [
                        filterChip("All"),
                        filterChip("Happy"),
                        filterChip("Okay"),
                        filterChip("Neutral"),
                        filterChip("Sad"),
                        filterChip("Down"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Entries list
            if (journalEntries.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "No entries found.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              Column(
                children: journalEntries.map((entry) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Text(entry["mood"] ?? ""),
                      title: Text(entry["text"] ?? ""),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget moodChip(String mood, String emoji) {
    return ChoiceChip(
      label: Text("$emoji $mood"),
      selected: selectedMood == mood,
      onSelected: (bool selected) {
        setState(() {
          selectedMood = mood;
        });
      },
    );
  }

  Widget filterChip(String mood) {
    return ChoiceChip(
      label: Text(mood),
      selected: selectedFilter == mood,
      onSelected: (bool selected) {
        if (selected) {
          setState(() {
            selectedFilter = mood;
          });
        }
      },
    );
  }
}
