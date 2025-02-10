import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showSnackbar(
      BuildContext context, {
        required String message,
        Color backgroundColor = Colors.black87,
        Duration duration = const Duration(seconds: 3),
        String? actionLabel,
        VoidCallback? onAction,
      }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: actionLabel != null && onAction != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: onAction,
        textColor: Colors.yellowAccent,
      )
          : null,
      behavior: SnackBarBehavior.floating, // Makes it float above UI
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
