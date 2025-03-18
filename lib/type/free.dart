import 'package:flutter/material.dart';

class FreeCoursesScreen extends StatelessWidget {
  final List<Map<String, String>> freeCourses = [
    {"title": "Free Course 1", "subtitle": "Flutter Basics"},
    {"title": "Free Course 2", "subtitle": "Dart for Beginners"},
    {"title": "Free Course 3", "subtitle": "UI Design with Flutter"},
    {"title": "Free Course 4", "subtitle": "State Management in Flutter"},
    {"title": "Free Course 5", "subtitle": "Advanced Dart Programming"},
    {"title": "Free Course 6", "subtitle": "Building Mobile Apps with Flutter"},
  ];

  FreeCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Free Courses Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: freeCourses.length,
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
                      freeCourses[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      freeCourses[index]["subtitle"]!,
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
