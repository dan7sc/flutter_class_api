import 'dart:convert';

import 'package:http/http.dart' as http;

void getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse('$baseURL/users');
  final response = await http.get(url);
  print(response.statusCode);

  final json = jsonDecode(response.body);
  print(json[0]['name']);
}

void main() {
  getPosts();
}
