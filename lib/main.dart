import 'dart:convert';

import 'package:http/http.dart' as http;

void getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse(
    '$baseURL/posts/1'
  );
  final response = await http.delete(url, body: {"name": "Daniel"});
  print(response.statusCode);
  if(response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(json);
  }
}

void main() {
  getPosts();
}
