import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:q_final_project/controller/top_new_controller.dart';
import 'package:q_final_project/controller/top_trending_controller.dart';
import 'package:q_final_project/home_screen/listing_page.dart';
import 'package:q_final_project/home_screen/top_new.dart';
import 'package:q_final_project/home_screen/top_trending.dart';
import 'package:q_final_project/widgets/horizontal_list_instructor.dart';

class CourseIntroScreen extends StatefulWidget {
  var courseInfo;
  CourseIntroScreen({@required this.courseInfo});

  @override
  _CourseIntroScreenState createState() => _CourseIntroScreenState();
}

class _CourseIntroScreenState extends State<CourseIntroScreen> {
  String courseId;

  BetterPlayerController _betterPlayerController;
  Widget videoPlay() {
    if (widget.courseInfo["promoVidUrl"] != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          controller: _betterPlayerController,
        ),
      );
    } else {
      return SizedBox(
        height: 0.1,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.courseInfo["promoVidUrl"] != null) {
      BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network, widget.courseInfo["promoVidUrl"]);
      _betterPlayerController = BetterPlayerController(
          BetterPlayerConfiguration(),
          betterPlayerDataSource: betterPlayerDataSource);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('React'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          videoPlay(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.courseInfo["title"],
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )
        ])));
  }
}
