import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishy/widgets/loadingWidget.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(
            height: 8,
          ),
          Text(message)
        ],
      ),
    );
  }
}
