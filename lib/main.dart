import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uerId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

void getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse(
    '$baseURL/posts',
  );
  final response = await http.get(url);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List;
    final posts = json.map((e) => Post.fromJson(e)).toList();
    print(posts);
  }
}

void main() {
  getPosts();
}
