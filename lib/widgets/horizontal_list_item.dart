import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalListItem extends StatelessWidget {
  String title, subtitle, description, createdAt;
  int ratedNumber, soldNumber;
  double totalHours;
  String imageUrl;
  EdgeInsets paddingElement = EdgeInsets.only(left: 4.0, top: 5.0);
  HorizontalListItem(
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
      child: Container(
        margin: EdgeInsets.only(left: 8.0, top: 4.0, right: 4.0),
        height: 270.0,
        width: 200.0,
        color: Colors.grey.shade700,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imageUrl,
                height: 150.0,
                width: 200.0,
              ),
              Container(
                padding: paddingElement,
                child: Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              Container(
                padding: paddingElement,
                child: Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 15.0, color: Colors.grey.shade500),
                ),
              ),
              Container(
                padding: paddingElement,
                child: Text(
                  "$description  .  ${dateFormat(createdAt)}  .  ${totalHours}h",
                  style: TextStyle(
                      fontSize: 15.0, color: Colors.grey.shade500),
                ),
              ),
            ]),
      ),
    );
  }
}
