import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:consumir_api_rest/common/constants/url_constants.dart';
import 'package:consumir_api_rest/common/enumartions.dart';

class HTTPExecute {
  String resource;
  Map<String, dynamic> parameters;
  Map<String, dynamic> queryParameters;

  HTTPExecute({
    required this.resource,
    this.parameters = const {},
    this.queryParameters = const {},
  });

  get() {

  }

  post() {

  }

  put() {

  }

  delete() {

  }

  executeMethod(HTTPMethod httpMethod) async {
    http.Response response;

    switch(httpMethod){
      case HTTPMethod.get:
        response = await http.get(endPoint, headers: headers);
        break;
      case HTTPMethod.post:
        response = await http.post(endPoint, body: encodedParameters, headers: headers);
        break;
      case HTTPMethod.put:
        response = await http.put(endPoint, body: encodedParameters, headers: headers);
        break;
      case HTTPMethod.delete:
        response = await http.delete(endPoint, body: encodedParameters, headers: headers);
        break;
    }

    validateResponse(response);
  }

  Map<String, String> get headers => {
    "content-type": "application/json"
  };

  String get encodedParameters => json.encode(parameters);

  get endPoint => (queryParameters.isNotEmpty) ? Uri.https(url, resource, queryParameters) : Uri.parse(uri+resource);

  validateResponse(http.Response response) {
    return (response.statusCode >= 200 && response.statusCode < 300) 
      ? response.body.toString()
      : null; // Devolver error
  }

}