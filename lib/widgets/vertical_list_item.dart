import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalListItem extends StatelessWidget {
  String title, subtitle, description, createdAt;
  int ratedNumber, soldNumber, totalHours;
  String imageUrl;
  EdgeInsets paddingElement = EdgeInsets.only(left: 1.0, top: 3.0);
  VerticalListItem(
      {this.title,
      this.subtitle,
      this.description,
      this.ratedNumber,
      this.createdAt,
      this.imageUrl,
      this.soldNumber,
      this.totalHours});
  String dateFormat(String date) {
    DateTime a = DateTime.parse(date);
    return "${a.month}/${a.year}";
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("a");
      },
      child: InkWell(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                height: 70.0,
                width: 90.0,
              ),
              Container(
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,children: [
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    subtitle,
                    style:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade500),
                  ),
                ),
                Container(
                  child: Text(
                    "$description  .  ${dateFormat(createdAt)}  .  ${totalHours}h",
                    style:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade500),
                  ),
                ),
              ])),
              Icon(
                Icons.keyboard_control_rounded,
                size: 30.0,
                color: Colors.white,
              )
            ]),
      ),
    );
  }
}
