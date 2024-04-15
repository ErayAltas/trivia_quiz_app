import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class Helper {
  static void showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showToastError(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showToastSuccess(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
