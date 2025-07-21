import 'package:flutter/material.dart';

/// Displays a message in a SnackBar.
// ignore: public_member_api_docs
enum MessageType { error, success, warning }

/// This will display a message in a overlay.
void displayMessage({
  required BuildContext context,
  required String message,
  required MessageType type,
}) {
  switch (type) {
    case MessageType.error:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(message),
        ),
      );
    case MessageType.success:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    case MessageType.warning:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }
}
