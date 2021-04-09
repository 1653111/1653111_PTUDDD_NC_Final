import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:q_final_project/component.dart';
import 'package:q_final_project/widgets/horizontal_list_item.dart';

class TopNewWidget extends StatefulWidget {
  @override
  _TopNewWidgetState createState() => _TopNewWidgetState();
}

class _TopNewWidgetState extends State<TopNewWidget> {
  var topNew;
  @override
  initState() {
    topNew = top_new["payload"];
    // await http.post(
    //     Uri.parse("https://api.itedu.me/course/top-new"),
    //     headers: {"Accept": "application/json"},
    //     body: {"limit": 10, "page": 1});
    // var body = json.decode(response.body);
    // print(body);

  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
        height: 270.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: this.topNew.length,
            itemBuilder: (context, index) {
              return HorizontalListItem(imageUrl: topNew[index]["imageUrl"], title: topNew[index]["title"], subtitle: topNew[index]["subtitle"], createdAt: topNew[index]["createdAt"],description: topNew[index]["description"],ratedNumber: topNew[index]["ratedNumber"],soldNumber: topNew[index]["soldNumber"],totalHours: topNew[index]["totalHours"],);
            }));
  }
}
