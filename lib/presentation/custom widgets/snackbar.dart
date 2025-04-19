import 'package:flutter/material.dart';
import 'package:sda_explorers_app/utils/constants.dart';

enum SBMessageType { success, error, info }

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SBMessageType type = SBMessageType.info,
    String error = '',
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.clearSnackBars();

    scaffoldMessenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        backgroundColor: getBackgroundColor(type),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        content: Row(
          children: [
            Icon(getIcon(type), color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(IS_DEV_MODE && error.isNotEmpty ? error : message, style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onTap: () {
                scaffoldMessenger.hideCurrentSnackBar();
              },
            )
          ],
        ),
      ),
    );
  }
}

getIcon(SBMessageType type) {
  switch (type) {
    case SBMessageType.success:
      return Icons.check_circle;
    case SBMessageType.error:
      return Icons.error;
    case SBMessageType.info:
      return Icons.info;
  }
}

Color getBackgroundColor(SBMessageType type) {
  switch (type) {
    case SBMessageType.success:
      return Colors.green;
    case SBMessageType.error:
      return Colors.red.shade500;
    case SBMessageType.info:
      return Colors.blue;
  }
}
