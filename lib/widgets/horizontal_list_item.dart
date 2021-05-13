import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HorizontalListItem extends StatelessWidget {
  String title, subtitle, description, createdAt;
  int soldNumber;
  double totalHours, ratedNumber;
  String imageUrl;
  EdgeInsets paddingElement = EdgeInsets.only(left: 4.0, top: 3.0);
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 200.0,
                height: 130.0,
                child: FittedBox(
                  child: Image.network(
                    imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  title,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  maxLines: 2,
                  minFontSize: 13.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  subtitle,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey.shade500),
                  maxLines: 2,
                  minFontSize: 11.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: paddingElement,
                child: AutoSizeText(
                  "$description  .  ${dateFormat(createdAt)}  .  ${totalHours}h",
                  style: TextStyle(fontSize: 11.0, color: Colors.grey.shade500),
                  maxLines: 2,
                  minFontSize: 10.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                  padding: paddingElement,
                  child: FittedBox(
                    child: RatingBar.builder(
                        initialRating: ratedNumber,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: null,itemSize: 10.0,),
                    fit: BoxFit.fill,
                  )),
            ]),
      ),
    );
  }
}
