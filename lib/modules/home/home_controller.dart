import 'package:class_api/shared/custom_dio/custom_dio.dart';
import 'package:class_api/shared/models/post.dart';

class HomeController {
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
}
