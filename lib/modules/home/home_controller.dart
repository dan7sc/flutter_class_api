import 'package:class_api/modules/home/home_repository.dart';
import 'package:class_api/shared/models/post.dart';

class HomeController {
  final repository = HomeRepository();
  var posts = <Post>[];

  Future<void> getPosts() async {
    final response = await repository.getPosts();
    posts = response;
  }
}
