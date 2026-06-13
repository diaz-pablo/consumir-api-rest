import 'package:consumir_api_rest/common/constants/url_constants.dart';
import 'package:consumir_api_rest/http_protocol/http_execute.dart';

class ResourceExecute {
  // Obtener todos los posts -> https://jsonplaceholder.typicode.com/posts/
  static getPosts() => HTTPExecute(resource: postsResource).get();

  // Obtener un post -> https://jsonplaceholder.typicode.com/posts/1
  static getPost(int postId) => HTTPExecute(resource: postsResource+postId.toString()).get();

  // Obtener comentarios de un post -> https://jsonplaceholder.typicode.com/posts?userId=1
  static getUserPosts(int userId) => HTTPExecute(resource: postsResource, queryParameters: {"userId": userId.toString()}).get();

  // Crear un nuevo post -> /posts
  static createPost(Map<String, dynamic> parameters) => HTTPExecute(resource: postsResource, parameters: parameters).post();
  
  // Actualizar un post -> https://jsonplaceholder.typicode.com/posts/1
  static updatePost(int postId, Map<String, dynamic> parameters) => HTTPExecute(resource: postsResource+postId.toString(), parameters: parameters).put();
  
  // Eliminar un post -> https://jsonplaceholder.typicode.com/posts/1
  static deletePost(int postId) => HTTPExecute(resource: postsResource+postId.toString()).delete();
}