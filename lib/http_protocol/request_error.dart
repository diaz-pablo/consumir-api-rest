import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:consumir_api_rest/ui/components/errors/swipe_error.dart';
import 'package:consumir_api_rest/ui/components/errors/text_error.dart';
import 'package:consumir_api_rest/common/enumartions.dart';

class RequestError {
  TypeRequestError typeRequestError; 
  Widget? swipeError;
  Widget? textError;
  String messageError;   
  http.Response? response;

  RequestError({
    required this.typeRequestError,
    this.swipeError,
    this.textError,
    this.messageError = "",
    this.response
  });

  getRequestError() {
    switch(typeRequestError) {
      case TypeRequestError.connectionError:
        return getMessage("Sin conexión");
      case TypeRequestError.serverError:
        return getMessage("Error en el servidor ${response!.statusCode}");
      case TypeRequestError.messageError:
        return getMessage(messageError);
    }
  }

  getMessage(String message) {
    messageError = message;
    swipeError = SwipeError(message);
    textError = TextError(message);

    return this;
  }
}