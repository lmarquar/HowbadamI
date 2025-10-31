import 'package:flutter/material.dart';

class MessengerService {
  late ScaffoldMessengerState _messenger;

  void register(ScaffoldMessengerState messenger) {
    _messenger = messenger;
  }

  void showSnackBar(String message, {Color? background}) {
    _messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: background ?? Colors.grey[800],
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void showError(Object error) {
    showSnackBar(_extractErrorMessage(error), background: Colors.red);
  }

  void showSuccess(String message) {
    showSnackBar(message, background: Colors.green);
  }

  String _extractErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}
