// ignore_for_file: unnecessary_import, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:education_app/pages/Course_screen.dart';
import 'package:education_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyWidget extends StatelessWidget {
  List imgList = ['Flutter', 'Python', 'React Native', 'C#'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            icon: CircleAvatar(
              backgroundColor: Color(0xFF674AEF),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                icon: Icon(
                  Icons.dashboard,
                  size: 30,
                  color: Color(0xFF674AEF),
                )),
          )
        ],
      ),
      body: GridView.builder(
          itemCount: imgList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => CourseScreen(imgList[index]));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        "images/${imgList[index]}.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      imgList[index],
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
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
          }),
    );
  }
}
