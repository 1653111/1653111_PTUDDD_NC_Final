import 'package:flutter/material.dart';
import 'package:q_final_project/controller/user_controller.dart';
import 'package:q_final_project/dashboard/dashboard.dart';
import 'package:get/get.dart';
import 'package:q_final_project/login_screen/register_screen.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _username = "", _password = "";
  TextEditingController _textUsername, _textPassword;
  UserController user = Get.put(UserController());
  bool obscure = true;
  @override
  void initState() {
    super.initState();
    _textUsername = TextEditingController(text: _username);
    _textPassword = TextEditingController(text: _password);
  }

  void userLogin() async {
    await user.login(_username, _password);
    if (user.user != null) {
      Get.to(Dashboard());
    }
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
          Text("Email or username", style: TextStyle(fontSize: 14)),
          SizedBox(height: 6.0),
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
            controller: _textUsername,
            onChanged: (value) => _username = value.trim(),
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
            obscureText: obscure,
          ),
          ElevatedButton(
            onPressed: () {
              userLogin();
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
            child: Center(child: Text('Use Single Sign-On (SSO)')),
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
        ],
      ),
    );
  }
}
