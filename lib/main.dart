import 'package:http/http.dart' as http;

void getPosts() async {
  var url = Uri.parse('http://jsonplaceholder.typicode.com/posts');
  final response = await http.get(url);
  print(response);
}

void main() {
  getPosts();
}
