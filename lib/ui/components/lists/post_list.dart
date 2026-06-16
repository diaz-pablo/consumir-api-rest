import 'package:consumir_api_rest/models/post_model.dart';
import 'package:consumir_api_rest/ui/components/cards/post_card.dart';
import 'package:consumir_api_rest/ui/components/errors/list_future_error.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFutureError(view, PostModel().getPosts);
  }

  view(List posts) {
    return ListView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        PostModel postModel = posts[index];
        return PostCard(postModel);
      }
    );
  }
}