import 'dart:convert';

import 'package:consumir_api_rest/http_protocol/request_error.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

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
    return checkConnection(HTTPMethod.get);
  }

  post() {
    return checkConnection(HTTPMethod.post);
  }

  put() {
    return checkConnection(HTTPMethod.put);
  }

  delete() {
    return checkConnection(HTTPMethod.delete);
  }

  checkConnection(HTTPMethod httpMethod) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return RequestError(typeRequestError: TypeRequestError.connectionError).getRequestError();
    } else {
      return executeMethod(httpMethod);
    }
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

    return validateResponse(response);
  }

  Map<String, String> get headers => {
    "Content-type": "application/json; charset=UTF-8"
  };

  String get encodedParameters => json.encode(parameters);

  get endPoint => (queryParameters.isNotEmpty) ? Uri.https(domain, resource, queryParameters) : Uri.parse(uri+resource);

  validateResponse(http.Response response) {
    return (response.statusCode >= 200 && response.statusCode < 300) 
      ? json.decode(response.body.toString())
      : RequestError(typeRequestError: TypeRequestError.serverError, response: response).getRequestError();
  }

}