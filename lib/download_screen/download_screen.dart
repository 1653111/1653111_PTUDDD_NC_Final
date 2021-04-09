import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_final_project/component.dart';
import 'package:q_final_project/widgets/vertical_list_item.dart';

class DownloadScreen extends StatelessWidget {
  var down;
  DownloadScreen() {
    down = downloads["payload"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Downloads", style: TextStyle(fontSize: 22)),
            TextButton(onPressed: () {}, child: Text("Remove all"))
          ],
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: down.length,
                itemBuilder: (context, index) {
                  return VerticalListItem(
                      imageUrl: down[index]["imageUrl"],
                      title: down[index]["title"],
                      subtitle: down[index]["subtitle"],
                      createdAt: down[index]["createdAt"],
                      description: down[index]["description"],
                      ratedNumber: down[index]["ratedNumber"],
                      soldNumber: down[index]["soldNumber"],
                      totalHours: down[index]["totalHours"]);
                }),
          ),
        )
      ]),
    );
  }
}
