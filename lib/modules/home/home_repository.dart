import 'package:class_api/shared/custom_dio/custom_dio.dart';
import 'package:class_api/shared/models/post.dart';

class HomeRepository {
  final client = CustomDio();

  Future<List<Post>> getPosts() async {
    final response = await client.get("/posts");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = response.data as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    }
    return [];
  }
}