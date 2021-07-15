import 'dart:convert';

import 'package:http/http.dart' as http;

void getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse(
    '$baseURL/posts'
  );
  final response = await http.post(url, body: {"name": "Daniel"});
  print(response.statusCode);
  if(response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(json[0]['name']);
  }
}

void main() {
  getPosts();
}
