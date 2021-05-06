import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopTrendingController extends GetxController {
  var topTrending;
  Future<void> loadTopTrending() async {
    var response = await http.post(
        Uri.https("api.letstudy.org", "/course/top-trending"),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"limit": 10, "page": 1}));
    var tmp = response.body;
    var tmp1 = json.decode(tmp);
    topTrending = tmp1['payload'];
    update();
  }
}
