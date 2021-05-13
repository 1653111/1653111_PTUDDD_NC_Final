import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var user;
  Future<void> login(String email, String password) async {
    var response = await http.post(Uri.https("api.letstudy.org", "/user/login"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"email": email, "password": password}));
    var tmp = response.body;
    var tmp1 = json.decode(tmp);
    if (tmp1["message"] == "OK") {
      user = tmp1['userInfo'];
    }
    update();
  }
}
