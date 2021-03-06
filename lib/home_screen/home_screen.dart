import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_final_project/controller/top_new_controller.dart';
import 'package:q_final_project/controller/top_trending_controller.dart';
import 'package:q_final_project/home_screen/listing_page.dart';
import 'package:q_final_project/home_screen/top_new.dart';
import 'package:q_final_project/home_screen/top_trending.dart';
import 'package:q_final_project/widgets/horizontal_list_instructor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('React'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade700)),
                  onPressed: () {
                    Get.to(ListingPage(Get.find<TopNewController>().topNew));
                  },
                  child: Row(
                    children: [
                      Text("See all"),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(height: 15.0),
          TopNew(),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade700)),
                  onPressed: () {
                    Get.to(ListingPage(
                        Get.find<TopTrendingController>().topTrending));
                  },
                  child: Row(
                    children: [
                      Text("See all"),
                      Icon(
                        Icons.arrow_right,
                      )
                    ],
                  ))
            ],
          ),
          TopTrending(),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Instructors",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text("")
            ],
          ),
          SizedBox(height: 10.0),
          HorizontalListInstructor()
        ]),
      ),
    );
  }
}
