import 'package:class_api/modules/home/home_repository.dart';
import 'package:class_api/shared/models/post.dart';

enum HomeStatus { empty, loading, success, error }

class HomeController {
  final repository = HomeRepository();
  Function? _onListen;
  var posts = <Post>[];
  var status = HomeStatus.empty;

  Future<void> getPosts() async {
    update(HomeStatus.loading);
    final response = await repository.getPosts();
    posts = response;
    update(HomeStatus.success);
  }

  void update(HomeStatus status) {
    this.status = status;
    if (_onListen != null) {
      _onListen!();
    }
  }
}
