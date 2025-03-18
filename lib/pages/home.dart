// ignore_for_file: unused_import, prefer_const_constructors

import 'package:education_app/auth/login.dart';
import 'package:education_app/pages/Course_screen.dart';
import 'package:education_app/pages/category.dart';
import 'package:education_app/type/book.dart';
import 'package:education_app/type/cat.dart';
import 'package:education_app/type/class.dart';
import 'package:education_app/type/free.dart';
import 'package:education_app/type/leader.dart';
import 'package:education_app/type/live.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> classList = [
    CategoryScreen(), // Assuming this is your category screen
    ClassScreen(),
    FreeCoursesScreen(),
    BookstoreScreen(),
    LiveCoursesScreen(),
    LeaderboardScreen(),
  ];
  List catNames = [
    "Category",
    "Class",
    "Free Courses",
    "BookStore",
    "Live Courses",
    "LeaderBoard"
  ];

  List<Color> catColors = [
    const Color(0xFFFFCF2F),
    const Color(0xFF6FE08D),
    const Color(0xFF61BDFD),
    const Color(0xFFFC7C7F),
    const Color(0xFFCB84FB),
    const Color(0xFF78E667),
  ];

  List<Icon> catIcons = [
    const Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.video_library,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.assignment,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.store,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.emoji_events,
      color: Colors.white,
      size: 30,
    ),
  ];

  List imgList = ['Flutter', 'Python', 'React Native', 'C#'];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => HomeScreen());
                        },
                        icon: const Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Hi Programmer",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Here.....",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.1),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => classList[index]); // Navigate on tap
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: catColors[index],
                                shape: BoxShape.circle),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            catNames[index],
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          )
                        ],
                      ),
                    );
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Courses",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                    itemCount: imgList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height - 50 - 25) /
                                (4 * 240),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CourseScreen(imgList[index]));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "images/${imgList[index]}.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                imgList[index],
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "55 videos",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
