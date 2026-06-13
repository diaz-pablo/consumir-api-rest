import 'package:consumir_api_rest/common/validate.dart';

class PostModel {
  int id;
  String title;
  String body;
  int userId;

  PostModel({
    this.id = 0,
    this.title = "",
    this.body = "",
    this.userId = 0
  });

  // Map del server lo convertimos en un objeto de este modelo
  toObject(Map<dynamic, dynamic> data) {
    Validate validate = Validate(data);

    return PostModel(
      id: validate.checkKeyExists("id", 0), // Tal como devuelve la key la API
      title: validate.checkKeyExists("title", ""), // Tal como devuelve la key la API
      body: validate.checkKeyExists("body", ""), // Tal como devuelve la key la API
      userId: validate.checkKeyExists("userId", 0) // Tal como devuelve la key la API
    );
  }

  // Crear Map para enviar al server
  toMap() {
    return {
      "id": id > 0 ? id.toString() : "",
      "title": title,
      "body": body,
      "userId": userId.toString()
    };
  }
}