import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:error_handling/exception/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {

  static const int TIME_OUT_DURATION = 10;
  static const String BASE_URL = 'https://jsonplaceholder.typicode.com';

  Future<dynamic> get(String api) async {
    var uri = Uri.parse(BASE_URL + api);
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding in time', uri.toString());
    }

  }

  Future<dynamic> post(String api, dynamic payloadObject) async {
    var uri = Uri.parse(BASE_URL + api);
    var payload = json.encode(payloadObject);
    try {
      var response = await http.post(uri, body: payload).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responding in time', uri.toString());
    }

  }

  dynamic _processResponse(http.Response response) {
    switch(response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes).toString(), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedExceptions(utf8.decode(response.bodyBytes).toString(), response.request!.url.toString());
      case 404:

        throw ApiNotRespondingException('Not Found', response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred with code : ${response.statusCode}', response.request!.url.toString());
    }
  }

}