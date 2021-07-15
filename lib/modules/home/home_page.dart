import 'package:class_api/modules/home/home_controller.dart';
import 'package:class_api/shared/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getPosts();
    controller.listen((status) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: controller.posts.length,
        itemBuilder: (_, index) => ItemListTileWidget(
          title: controller.posts[index].title ?? "",
        ),
      ),
    );
  }
}
