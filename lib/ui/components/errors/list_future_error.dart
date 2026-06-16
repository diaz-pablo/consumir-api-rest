import 'package:consumir_api_rest/common/validate.dart';
import 'package:consumir_api_rest/http_protocol/request_error.dart';
import 'package:flutter/material.dart';

class ListFutureError extends StatefulWidget {
  var method;
  var view;

  ListFutureError(this.view, this.method);

  @override
  State<ListFutureError> createState() => _ListFutureErrorState();
}

class _ListFutureErrorState extends State<ListFutureError> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.method(), // Metodo asincrono
      builder: (context, snapshot) {
        if (Validate.isNotRequestError(snapshot.data) && snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          // Ya cargo nuestro metodo asincrono
          return widget.view(snapshot.data); // Retornamos widget con los datos que acabamos de recibir
        } else if (snapshot.data is RequestError) {
          // Ocurrio un error
          RequestError requestError = snapshot.data as RequestError;

          return SizedBox.expand(
            child: RefreshIndicator(
              onRefresh: onRefresh,
              child: Center(
                child: requestError.swipeError!,
              ),
            ),
          );
        } else {
          // Mientras los datos se obtienen del servidor
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Future<void> onRefresh() async {
    // await widget.method();
    setState(() {}); // Recarga el diseño y ejecuta el metodo pero en el FutureBuilder
  }
}