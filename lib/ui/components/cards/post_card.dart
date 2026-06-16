import 'package:consumir_api_rest/models/post_model.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  PostModel postModel;

  PostCard(this.postModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          postModel.title.length > 10
              ? '${postModel.title.substring(0, 10)}...'
              : postModel.body,
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          postModel.body.length > 60
              ? '${postModel.body.substring(0, 60)}...'
              : postModel.body,
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}