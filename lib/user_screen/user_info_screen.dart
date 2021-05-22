import 'package:flutter/material.dart';
import 'package:q_final_project/controller/user_controller.dart';
import 'package:q_final_project/dashboard/dashboard.dart';
import 'package:get/get.dart';

class UserInfoScreen extends StatelessWidget {
  UserController userController = Get.find<UserController>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        title: Center(child: Text("Sign in")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(userController.user["avatar"]),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            userController.user["name"],
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0,),
          
        ],
      ),
    );
  }
}
