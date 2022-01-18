import 'dart:convert';
import '../json_module/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  List<Post> posts = [];
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1/posts'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var list = json.decode(response.body) as List;
    posts = list.map((i) => Post.fromJson(i)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  print(posts.runtimeType); //returns List<Img>
  print(posts[0].body); //returns Img

  return posts;
}
