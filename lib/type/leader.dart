import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, String>> leaderboard = [
    {"rank": "1", "name": "Abdul Raheem", "score": "1500"},
    {"rank": "2", "name": "Anees Khan", "score": "1450"},
    {"rank": "3", "name": "Laiba Naimat", "score": "1300"},
    {"rank": "4", "name": "Nayab Sultana", "score": "1200"},
    {"rank": "5", "name": "Mohammad", "score": "1100"},
    {"rank": "6", "name": "Shayan", "score": "1000"},
  ];

  LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Leaderboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF674AEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: leaderboard.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF674AEF),
                  child: Text(
                    leaderboard[index]['rank']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  leaderboard[index]['name']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  'Score: ${leaderboard[index]['score']}',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                trailing: index < 3
                    ? Icon(
                        Icons.star,
                        color: index == 0
                            ? const Color.fromARGB(255, 239, 199, 1)
                            : index == 1
                                ? Colors.amber
                                : Colors.black,
                        size: 30,
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
