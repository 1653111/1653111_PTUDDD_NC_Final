import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:q_final_project/component.dart';
import 'package:q_final_project/controller/top_new_controller.dart';
import 'package:q_final_project/controller/top_trending_controller.dart';
import 'package:q_final_project/widgets/vertical_list_item.dart';

class ListingPage extends StatelessWidget {
  String title;
  var content;
  ListingPage(this.content);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("")),
        ),
        body: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            return VerticalListItem(course: content[index]);
          },
        ));
  }
}
