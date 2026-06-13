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
    return PostModel(
      id: data["id"], // Tal como devuelve la key la API
      title: data["title"], // Tal como devuelve la key la API
      body: data["body"], // Tal como devuelve la key la API
      userId: data["userId"] // Tal como devuelve la key la API
    );
  }

  // Crear Map para enviar al server
  toMap() {
    return {
      "id": id > 0 ? id : "",
      "title": title,
      "body": body,
      "userId": userId.toString()
    };
  }
}