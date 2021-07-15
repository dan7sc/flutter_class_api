import 'models/post.dart';
import 'shared/custom_dio/custom_dio.dart';

void getPosts() async {
  final client = CustomDio();
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
