import 'package:class_api/modules/home/home_controller.dart';
import 'package:class_api/shared/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  final HomeController controller;
  FeedPage({Key? key, required this.controller}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    if(widget.controller.status == HomeStatus.success) {
      return ListView.builder(
        itemCount: widget.controller.posts.length,
        itemBuilder: (_, index) => ItemListTileWidget(
          title: widget.controller.posts[index].title ?? "",
        ),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
