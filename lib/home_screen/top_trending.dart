import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:q_final_project/component.dart';
import 'package:q_final_project/widgets/horizontal_list_item.dart';

class TopTrending extends StatefulWidget {
  @override
  _TopTrendingState createState() => _TopTrendingState();
}

class _TopTrendingState extends State<TopTrending> {
  var topTrending;
  @override
  initState() {
    // await http.post(
    //     Uri.parse("https://api.itedu.me/course/top-new"),
    //     headers: {"Accept": "application/json"},
    //     body: {"limit": 10, "page": 1});
    // var body = json.decode(response.body);
    // print(body);
    this.topTrending = top_trending["payload"];
    print(topTrending);
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
        height: 270.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: this.topTrending.length,
            itemBuilder: (context, index) {
              return HorizontalListItem(imageUrl: topTrending[index]["imageUrl"], title: topTrending[index]["title"], subtitle: topTrending[index]["subtitle"], createdAt: topTrending[index]["createdAt"],description: topTrending[index]["description"],ratedNumber: topTrending[index]["ratedNumber"],soldNumber: topTrending[index]["soldNumber"],totalHours: topTrending[index]["totalHours"],);
            }));
  }
}
