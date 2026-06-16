import 'package:consumir_api_rest/common/validate.dart';
import 'package:consumir_api_rest/http_protocol/request_error.dart';
import 'package:consumir_api_rest/models/post_model.dart';
import 'package:flutter/material.dart';

class PostFormScreen extends StatelessWidget {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario Post")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: InputDecoration(
                  hintText: "Titulo",
                  prefixIcon: Icon(Icons.title)
                ),
              ),
              TextFormField(
                controller: bodyCtrl,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Descripcion",
                  prefixIcon: Icon(Icons.title)
                ),
              ),
              TextButton(
                onPressed: () => save(context), 
                child: Text("Guardar")
              )
            ],
          )
        ),
      ),
    );
  }

  void save(BuildContext context) async {
    if (keyForm.currentState!.validate()) {
      var post = await PostModel().savePost();
      if (Validate.isNotRequestError(post)) {
        Navigator.pop(context);
      } else {
        RequestError requestError = post as RequestError;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: requestError.textError!)
        );
      }
    }
  }
}