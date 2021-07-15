import 'package:class_api/modules/home/home_controller.dart';

void main() async {
  final controller = HomeController();
  await controller.getPosts();
  print('posts: ${controller.posts}');
}
