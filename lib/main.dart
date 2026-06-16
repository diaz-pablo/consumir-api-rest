import 'package:consumir_api_rest/common/validate.dart';
import 'package:consumir_api_rest/http_protocol/request_error.dart';
import 'package:consumir_api_rest/models/post_model.dart';
import 'package:consumir_api_rest/ui/components/lists/post_list.dart';
import 'package:consumir_api_rest/ui/screen/post_form_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // executeMethod();
  }

  executeMethod() async {
    // ############## GET
    // var posts = await PostModel().getPosts();
    // // var posts = await PostModel(id: 1).getPost();
    // // var posts = await PostModel(userId: 1).getUserPosts();

    // if(Validate.isNotRequestError(posts)) {
    //   print("IDs de los POSTS: " + posts.toString());
    //   // print("TITULO: " + posts.toString());
    // } else {
    //   RequestError requestError = posts as RequestError;
    //   print(requestError.messageError);
    // }
    
    // ############## POST
    // var post = await PostModel(title: "nuevo post", body: "hola mundo!", userId: 1).savePost();
    // if (Validate.isNotRequestError(post)) {
    //   print("Post save: " + post.toString());
    // } else {
    //   RequestError requestError = post as RequestError;
    //   print("Post save error: " + requestError.messageError);
    // }

    // ############## PUT
    // var post = await PostModel(id: 1, title: "edit post", body: "hola mundo!", userId: 1).savePost();
    // if (Validate.isNotRequestError(post)) {
    //   print("Post update: " + post.toString());
    // } else {
    //   RequestError requestError = post as RequestError;
    //   print("Post update error: " + requestError.messageError);
    // }

    // ############## PUT
    var post = await PostModel(id: 1).deletePost();
    if (Validate.isNotRequestError(post)) {
      print("Post delete: " + post.toString());
    } else {
      RequestError requestError = post as RequestError;
      print("Post delete error: " + requestError.messageError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PostList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostFormScreen())),
        tooltip: "Crear post",
        child: const Icon(Icons.add),
      ),
    );
  }
}
