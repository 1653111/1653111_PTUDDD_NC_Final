import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HorizontalListInstructor extends StatelessWidget {
  dynamic instructors;
  EdgeInsets paddingElement = EdgeInsets.only(left: 4.0, top: 3.0);
  String dateFormat(String date) {
    DateTime a = DateTime.parse(date);
    return "${a.month}/${a.year}";
  }

  Future<dynamic> loadData() async {
    var response = await http.get(
      Uri.https("api.letstudy.org", "/instructor"),
      headers: {'Content-type': 'application/json'},
    );
    var tmp = response.body;
    var tmp1 = json.decode(tmp);
    instructors = tmp1["payload"];
    return instructors;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270.0,
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: instructors.length,
                    separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 105,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          instructors[index]["user.avatar"]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              AutoSizeText(
                                instructors[index]["user.name"],
                                maxLines: 1,
                                maxFontSize: 11.0,
                                minFontSize: 10.0,
                                overflow: TextOverflow.ellipsis,
                              )
                            ]),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
