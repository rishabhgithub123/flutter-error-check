import 'dart:async';

import 'package:error_handling/base_classes/base_client.dart';
import 'package:error_handling/controller/base_controller.dart';
import 'package:error_handling/dialog_helper/dialog_helper.dart';
import 'package:error_handling/exception/app_exceptions.dart';
import 'package:logger/logger.dart';

class TestController with BaseController {

  Logger _logger = Logger();

  Future<dynamic> fetchPost() async {
    var response = await BaseClient().get('/todos/1').catchError(handleError);
    print(response);
    return response;
  }

  Future<dynamic> fetchData() async {
    var response = await BaseClient().get('/users').catchError(handleError);
    _logger.d(response);
    return response;
  }

}