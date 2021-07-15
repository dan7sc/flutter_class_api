import 'package:http/http.dart' as http;

void getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse('$baseURL/users');
  final response = await http.get(url);
  print(response.body);
}

void main() {
  getPosts();
}
