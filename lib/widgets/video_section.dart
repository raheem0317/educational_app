// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, avoid_renaming_method_parameters, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  List VideoList = [
    'Introduction to Flutter',
    'Installing Flutter on Windows',
    'Setup Emulator in windows',
    'Creating our FirstApp',
  ];
  @override
  Widget build(BuildContext) {
    return ListView.builder(
        itemCount: VideoList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: index == 0
                    ? Color(0xFF674AEF)
                    : Color(0xFF674AEF).withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(VideoList[index]),
            subtitle: Text("20 min 50 sec"),
          );
        });
  }
}
