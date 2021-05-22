import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:q_final_project/course/course_intro_screen.dart';

class VerticalListItem extends StatelessWidget {
  var course;
  EdgeInsets paddingElement = EdgeInsets.only(left: 1.0, top: 3.0);
  VerticalListItem({this.course});
  String dateFormat(String date) {
    DateTime a = DateTime.parse(date);
    return "${a.month}/${a.year}";
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(CourseIntroScreen(
          courseInfo: course,
        ));
      },
      child: InkWell(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                course["imageUrl"],
                height: 70.0,
                width: 90.0,
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      child: AutoSizeText(
                        course["title"],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        maxLines: 2,
                        minFontSize: 12.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      child: AutoSizeText(
                        course["subtitle"],
                        style: TextStyle(
                            fontSize: 14.0, color: Colors.grey.shade500),
                        maxLines: 1,
                        minFontSize: 12.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      child: AutoSizeText(
                        "${course["description"]}  .  ${dateFormat(course["createdAt"])}  .  ${course["totalHours"]}h",
                        style: TextStyle(
                            fontSize: 12.0, color: Colors.grey.shade500),
                        maxLines: 1,
                        minFontSize: 10.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ])),
              Icon(
                Icons.keyboard_control_rounded,
                size: 10.0,
                color: Colors.white,
              )
            ]),
      ),
    );
  }
}
