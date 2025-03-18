import 'package:flutter/material.dart';

class BookstoreScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      "title": "Flutter for Beginners",
      "author": "John Doe",
      "image": "flutter_book"
    },
    {"title": "Mastering Dart", "author": "Jane Smith", "image": "dart_book"},
    {
      "title": "React Native Explained",
      "author": "Alice Johnson",
      "image": "react_book"
    },
    {
      "title": "Advanced C# Programming",
      "author": "Bob Brown",
      "image": "csharp_book"
    },
    {
      "title": "Design Patterns in Python",
      "author": "Emily White",
      "image": "python_book"
    },
    {
      "title": "Building Mobile Apps",
      "author": "David Green",
      "image": "mobile_book"
    },
  ];

  BookstoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookstore',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: books.length,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/logo.png", // Replace with your image path
                          width: 80,
                          height: 50,
                        ),
                      ],
                    ),
                    // SizedBox(height: 10),
                    Text(
                      books[index]['title']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "by ${books[index]['author']!}",
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
