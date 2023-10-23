import 'package:flutter/material.dart';
import 'package:knowunity_flutter/navigation/app_navigator.dart';

mixin ErrorDialogRoute {
  Future<void> showError(String failure) => showDialog(
        context: AppNavigator.navigatorKey.currentState!.context,
        builder: (context) => ErrorDialog(failure: failure),
      );
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.failure,
    Key? key,
  }) : super(key: key);

  final String failure;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(failure),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Dismiss'),
        )
      ],
    );
  }
}
