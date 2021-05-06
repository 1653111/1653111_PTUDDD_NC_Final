import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_final_project/controller/top_trending_controller.dart';
import 'package:q_final_project/widgets/horizontal_list_item.dart';

class TopTrending extends StatefulWidget {
  @override
  _TopTrendingState createState() => _TopTrendingState();
}

class _TopTrendingState extends State<TopTrending> {
  TopTrendingController topT = Get.put(TopTrendingController());
  Future<dynamic> loadData() async {
    await topT.loadTopTrending();
    return topT.topTrending;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270.0,
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topT.topTrending.length,
                    itemBuilder: (context, index) {
                      return HorizontalListItem(
                        imageUrl: topT.topTrending[index]["imageUrl"],
                        title: topT.topTrending[index]["title"],
                        subtitle: topT.topTrending[index]["subtitle"],
                        createdAt: topT.topTrending[index]["createdAt"],
                        description: topT.topTrending[index]
                            ["description"],
                        ratedNumber: topT.topTrending[index]
                            ["ratedNumber"],
                        soldNumber: topT.topTrending[index]["soldNumber"],
                        totalHours: topT.topTrending[index]["totalHours"],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
