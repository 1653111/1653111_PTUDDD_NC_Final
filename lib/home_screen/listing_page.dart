import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:q_final_project/component.dart';
import 'package:q_final_project/widgets/vertical_list_item.dart';

class ListingPage extends StatelessWidget {
  String title;
  var content;
  ListingPage(this.title){
    if (title == 'New') {
      content = top_new["payload"];
    }
    else {
      content = top_trending["payload"];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),
        ),
        body: ListView.builder(
          itemCount: content.length,
          itemBuilder: (context, index) {
            return VerticalListItem(imageUrl: content[index]["imageUrl"], title: content[index]["title"], subtitle: content[index]["subtitle"], createdAt: content[index]["createdAt"],description: content[index]["description"],ratedNumber: content[index]["ratedNumber"],soldNumber: content[index]["soldNumber"],totalHours: content[index]["totalHours"]);
          },
        ));
  }
}
