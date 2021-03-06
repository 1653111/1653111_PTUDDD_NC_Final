import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_final_project/widgets/horizontal_list_item.dart';
import 'package:q_final_project/controller/top_new_controller.dart';

class TopNew extends StatefulWidget {
  @override
  _TopNewState createState() => _TopNewState();
}

class _TopNewState extends State<TopNew> {
  TopNewController topN = Get.put(TopNewController());
  Future<dynamic> loadData() async {
    await topN.loadTopNew();
    return topN.topNew;
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
                    itemCount: topN.topNew.length,
                    itemBuilder: (context, index) {
                      return HorizontalListItem(
                        course: topN.topNew[index],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
