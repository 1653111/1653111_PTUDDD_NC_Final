import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:q_final_project/login_screen/auth_token.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = "", _password = "", _email = "", _phone = "";
  TextEditingController _textUsername, _textPassword, _textEmail, _textPhone;
  bool obscure= true;
  @override
  void initState() {
    super.initState();
    _textUsername = TextEditingController(text: _username);
    _textPassword = TextEditingController(text: _password);
    _textEmail = TextEditingController(text: _email);
    _textPhone = TextEditingController(text: _phone);
  }

  Future<void> register() async {
    var response1 = await http.post(
        Uri.https("api.letstudy.org", "/user/register"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          "username": _username,
          "email": _email,
          "phone": _phone,
          "password": _password
        }));
    var tmp = response1.body;
    var tmp1 = json.decode(tmp);
    print(tmp1);
    if (tmp1["message"] == "OK") {
      var response2 = await http.post(
          Uri.https("api.letstudy.org", "/user/send-activate-email"),
          headers: {'Content-type': 'application/json'},
          body: json.encode({
            "email": _email,
          }));
      var tmp2 = response2.body;
      var tmp3 = json.decode(tmp2);
      print(tmp3);
      if (tmp3["message"] == "OK") {
        Get.to(AuthTokenScreen());
      }
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
            controller: _textUsername,
            onChanged: (value) => _username = value.trim(),
          ),
          Text("Email", style: TextStyle(fontSize: 14)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textEmail,
            onChanged: (value) => _email = value.trim(),
          ),
          Text("Phone", style: TextStyle(fontSize: 14)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textPhone,
            onChanged: (value) => _phone = value.trim(),
          ),
          SizedBox(height: 6.0),
          Text("Password", style: TextStyle(fontSize: 14)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              prefix: IconButton(
                icon: Icon(Icons.remove_red_eye_rounded),
                iconSize: 17.0,
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
              hintText: '',
            ),
            controller: _textPassword,
            onChanged: (value) => _password = value.trim(),
            obscureText: true,
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
