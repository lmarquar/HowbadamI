import 'package:flutter/material.dart';
import 'package:howbadami/main.dart'; // import where navigatorKey is defined
import 'package:firebase_core/firebase_core.dart';

class Utils {
  static void showErrorSnackBar(Object error) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final message = _extractErrorMessage(error);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static void showSuccessSnackBar(String message) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static String _extractErrorMessage(Object error) {
    if (error is FirebaseException) {
      return error.message ?? 'An unknown Firebase error occurred.';
    }
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}
