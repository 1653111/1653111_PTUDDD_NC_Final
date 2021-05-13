import 'package:flutter/material.dart';
import 'package:q_final_project/home_screen/home_screen.dart';
import 'package:q_final_project/login_screen/signin_screen.dart';
import 'package:q_final_project/login_screen/register_screen.dart';
import 'package:get/get.dart';

class InitScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://googleflutter.com/sample_image.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("PLURALSIGHT", style: TextStyle(fontSize: 30)),
          SizedBox(
            height: 5.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SigninScreen()),
              );
            },
            child: Center(
              child: Text("Sign in"),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
          SizedBox(
            height: 5.0,
          ),
          OutlinedButton(
            onPressed: () {
              Get.to(RegisterScreen());
            },
            child: Center(child: Text('Subscribe to Pluralsight')),
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                color: Colors.blue,
                width: 1.0,
              )),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          OutlinedButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Center(child: Text('Explore without a subscription')),
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                color: Colors.blue,
                width: 1.0,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
