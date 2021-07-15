import 'dart:convert';

import 'package:flutter/material.dart';
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

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = List.empty();

  Future<List<Post>> getPosts() async {
    final baseURL = "http://jsonplaceholder.typicode.com";
    var url = Uri.parse(
      '$baseURL/posts',
    );
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();
      // print(posts);
      return posts;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(posts[index].id.toString()),
              title: Text(posts[index].title ?? ""),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await getPosts();
          setState(() {});
        },
        child: Icon(
          Icons.download,
          semanticLabel: "Get Posts",
        ),
      ),
    );
  }
}
