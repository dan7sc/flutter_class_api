import 'dart:convert';

import 'package:dio/dio.dart';
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
  final client = Dio(BaseOptions(baseUrl: baseURL));
  final response = await client.get("/posts");
  print(response.statusCode);
  if (response.statusCode == 200) {
    final json = response.data as List;
    final posts = json.map((e) => Post.fromJson(e)).toList();
    print(posts);
  }
}

void main() {
  getPosts();
}
