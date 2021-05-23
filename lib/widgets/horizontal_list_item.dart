import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:q_final_project/course/course_intro_screen.dart';

class HorizontalListItem extends StatelessWidget {
  var course;
  EdgeInsets paddingElement = EdgeInsets.only(left: 4.0, top: 3.0);
  HorizontalListItem(
      {this.course});
  String dateFormat(String date) {
    DateTime a = DateTime.parse(date);
    return "${a.month}/${a.year}";
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(CourseIntroScreen(courseInfo: course));
      },
      child: Container(
        margin: EdgeInsets.only(left: 8.0, top: 4.0, right: 4.0),
        height: 270.0,
        width: 200.0,
        color: Colors.grey.shade700,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 200.0,
                height: 130.0,
                child: FittedBox(
                  child: Image.network(
                    course["imageUrl"],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  course["title"],
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  maxLines: 2,
                  minFontSize: 13.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  course["subtitle"],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
                  maxLines: 2,
                  minFontSize: 11.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  "${course["description"]}  .  ${dateFormat(course["createdAt"])}  .  ${course["totalHours"]}h",
                  style: TextStyle(fontSize: 11.0, color: Colors.grey.shade500),
                  maxLines: 2,
                  minFontSize: 10.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                  padding: paddingElement,
                  child: FittedBox(
                    child: RatingBar.builder(
                      initialRating: course["ratedNumber"].toDouble(),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: null,
                      itemSize: 10.0,
                    ),
                    fit: BoxFit.fill,
                  )),
            ]),
      ),
    );
  }
}
