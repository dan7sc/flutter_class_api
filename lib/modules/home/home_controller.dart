import 'package:class_api/modules/home/home_repository.dart';
import 'package:class_api/shared/models/post.dart';

enum HomeStatus { empty, loading, success, error }

class HomeController {
  final repository = HomeRepository();
  var posts = <Post>[];
  var status = HomeStatus.empty;

  Future<void> getPosts() async {
    status = HomeStatus.loading;
    final response = await repository.getPosts();
    posts = response;
  }
}
