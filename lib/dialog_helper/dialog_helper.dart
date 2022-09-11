import 'package:error_handling/base_classes/navigation_service.dart';
import 'package:flutter/material.dart';

class DialogHelper {

  static BuildContext? dialogContext;

  static void showErrorSnackbar({String errorMessage = 'Something went wrong' }) {
    NavigationService.navigatorKey.currentState!.showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  static void showLoader() {
    showDialog(
      context: NavigationService.navigatorKey.currentState!.context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        dialogContext = context;
        return const Center(
          child: CircularProgressIndicator(),
          );
        },
      );
  }

  static void hideLoader() {
    if(dialogContext != null) {
      Navigator.pop(dialogContext!);
    }
  }
}