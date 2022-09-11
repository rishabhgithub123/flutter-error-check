import 'package:logger/logger.dart';

class AppException implements Exception {

  final String message;
  final String prefix;
  final String uri;

  Logger logger = Logger();

  AppException(this.message, this.prefix, this.uri) {
    logger.e('$prefix : $uri => $message');
  }




}

class BadRequestException extends AppException {
  BadRequestException(String message, String uri) : super(message, 'Bad Request', uri);
}

class FetchDataException extends AppException {
  FetchDataException(String message, String uri) : super(message, 'Unable to process', uri);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String message, String uri) : super(message, 'Api not responded', uri);
}

class UnAuthorizedExceptions extends AppException {
  UnAuthorizedExceptions(String message, String uri) : super(message, 'UnAuthorized request', uri);
}