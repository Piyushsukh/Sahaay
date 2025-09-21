import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> stories = [
    {
      "tag": "GROWTH",
      "quote":
          "Counselling felt safe for the first time. I could book sessions without anyone knowing, and that privacy gave me courage.",
      "name": "Priya",
      "role": "Psychology Student",
    },
    {
      "tag": "RELIEF",
      "quote":
          "This space helped me when I felt I couldn't speak to anyone. The AI support was there at 2 AM when my anxiety peaked.",
      "name": "ARJUN",
      "role": "Computer Science Student",
    },
    {
      "tag": "CONNECTION",
      "quote":
          "I found my voice and learned to ask for help. The peer support showed me I wasn't the only one struggling.",
      "name": "Rahul",
      "role": "Engineering Student",
    },
    {
      "tag": "WELLNESS",
      "quote":
          "The resource hub became my daily companion. Meditation guides and coping strategies helped me through exam stress.",
      "name": "Sneha",
      "role": "Medical Student",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: stories.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final story = stories[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lightbulb,
                            color: Colors.blue,
                            size: 40,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              story["tag"]!,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "“${story["quote"]}”",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            story["name"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            story["role"]!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              stories.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.green
                      : Colors.green.withOpacity(0.4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
