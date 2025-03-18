import 'package:flutter/material.dart';

class LiveCoursesScreen extends StatelessWidget {
  final List<Map<String, String>> liveCourses = [
    {
      "title": "Introduction to Flutter",
      "instructor": "John Doe",
      "image": "flutter_video"
    },
    {
      "title": "Advanced Dart Concepts",
      "instructor": "Jane Smith",
      "image": "dart_video"
    },
    {
      "title": "Building Apps with React Native",
      "instructor": "Alice Johnson",
      "image": "react_video"
    },
    {
      "title": "Mastering C# Programming",
      "instructor": "Bob Brown",
      "image": "csharp_video"
    },
    {
      "title": "Python for Data Science",
      "instructor": "Emily White",
      "image": "python_video"
    },
    {
      "title": "Building Cross-Platform Mobile Apps",
      "instructor": "David Green",
      "image": "mobile_video"
    },
  ];

  LiveCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: liveCourses.length,
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
                    // Display the course thumbnail
                    Image.asset(
                      "images/Flutter.png", // Replace with your image path
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(height: 10),
                    // Display the course title
                    Text(
                      liveCourses[index]['title']!,
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 5),
                    // Display the instructor name
                    Text(
                      "by ${liveCourses[index]['instructor']!}",
                      style: const TextStyle(fontSize: 5, color: Colors.grey),
                    ),
                    // SizedBox(height: 10),
                    // Play Button
                    Center(
                      child: IconButton(
                        onPressed: () {
                          // Add your play button functionality here
                          // For demo, we'll just show a dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    "Playing: ${liveCourses[index]['title']}"),
                                content: Text(
                                    "This is a demo video for ${liveCourses[index]['title']}"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.play_circle_fill,
                          size: 20,
                          color: Colors.green,
                        ),
                      ),
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
