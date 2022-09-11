import 'package:error_handling/dialog_helper/dialog_helper.dart';
import 'package:error_handling/exception/app_exceptions.dart';

class BaseController {

  void handleError(error) {
    DialogHelper.hideLoader();
    if(error is BadRequestException) {
      DialogHelper.showErrorSnackbar(errorMessage: error.message);
    } else if(error is FetchDataException) {
      DialogHelper.showErrorSnackbar(errorMessage: error.message);
    } else if(error is ApiNotRespondingException) {
      DialogHelper.showErrorSnackbar(errorMessage: error.message);
    } else {
      DialogHelper.showErrorSnackbar(errorMessage: error.message);
    }
  }

}