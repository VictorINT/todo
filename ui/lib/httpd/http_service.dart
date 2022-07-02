import 'dart:convert';
import 'package:http/http.dart';
import 'post_module.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Post>> getPosts() async {
    final Uri url = Uri.parse("http://192.168.1.154/site/todo/alltasks.php");
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
      body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "can t get posts";
    }
  }
}
