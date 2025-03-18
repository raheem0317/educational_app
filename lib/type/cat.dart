import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, String>> categoryItems = [
    {"title": "Flutter", "subtitle": "Descriptions for flutter"},
    {"title": "Python", "subtitle": "Descriptions for python"},
    {"title": "React Native", "subtitle": "Descriptions for react native"},
    {"title": "C#", "subtitle": "Descriptions for c#"},
    {"title": "Live Classes", "subtitle": "Descriptions for live classes"},
    {"title": "Free", "subtitle": "Descriptions for free courses"},
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categoryItems.length,
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
                      categoryItems[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryItems[index]["subtitle"]!,
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
