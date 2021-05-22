import 'package:flutter/material.dart';
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
                  return VerticalListItem(course: down[index],);
                }),
          ),
        )
      ]),
    );
  }
}
