import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  final List<Map<String, String>> classItems = [
    {"title": "First Class", "subtitle": "Introduction to Flutter"},
    {"title": "Second Class", "subtitle": "Advanced Flutter Concepts"},
    {"title": "Third Class", "subtitle": "Dart Basics"},
    {"title": "Fourth Class", "subtitle": "UI Design in Flutter"},
    {"title": "Fifth Class", "subtitle": "Flutter State Management"},
    {"title": "Sixeth Class", "subtitle": "Building Apps with Flutter"},
  ];

  ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Class Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: classItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            childAspectRatio: 3 / 2, // Adjust as needed
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classItems[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      classItems[index]["subtitle"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
