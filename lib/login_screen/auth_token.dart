import 'package:flutter/material.dart';
import 'package:q_final_project/dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:q_final_project/login_screen/init_screen.dart';

class AuthTokenScreen extends StatefulWidget {
  @override
  _AuthTokenScreenState createState() => _AuthTokenScreenState();
}

class _AuthTokenScreenState extends State<AuthTokenScreen> {
  String _token = "";
  TextEditingController _textToken;
  @override
  void initState() {
    super.initState();
    _textToken = TextEditingController(text: _token);
  }

  Future<void> register() async {
    var response1 =
        await http.put(Uri.https("api.letstudy.org", "/user/activate-email"),
            headers: {'Content-type': 'application/json'},
            body: json.encode({
              "token": _token,
            }));
    var tmp = response1.body;
    var tmp1 = json.decode(tmp);
    if (tmp1["message"] == "OK") {
      Get.to(InitScreen());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        title: Center(child: Text("Register")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Username", style: TextStyle(fontSize: 14)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textToken,
            onChanged: (value) => _token = value,
          ),
          ElevatedButton(
            onPressed: () async {
              await register();
            },
            child: Center(
              child: Text("Register"),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
        ],
      ),
    );
  }
}
