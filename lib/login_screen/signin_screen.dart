import 'package:flutter/material.dart';
import 'package:q_final_project/dashboard/dashboard.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _username = "", _password = "";
  TextEditingController _textUsername, _textPassword;
  @override
  void initState() {
    super.initState();
    _textUsername = TextEditingController(text: _username);
    _textPassword = TextEditingController(text: _password);
  }

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
          Text("Email or username", style: TextStyle(fontSize: 10)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textUsername,
            onChanged: (value) => _username = value.trim(),
          ),
          SizedBox(height: 6.0),
          Text("Password", style: TextStyle(fontSize: 10)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textPassword,
            onChanged: (value) => _password = value.trim(),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              Get.off(Dashboard());
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
            onPressed: () {},
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
            onPressed: () {},
            child: Center(child: Text('Forget')),
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
