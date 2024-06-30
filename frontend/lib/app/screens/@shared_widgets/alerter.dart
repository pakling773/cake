import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alerter {
  static showSimpleAlert(BuildContext context, title, message,
      {VoidCallback? onCancel}) {
    Widget okButton = CupertinoDialogAction(
      isDefaultAction: true,
      onPressed: onCancel ??
          () {
            Navigator.of(context).pop();
          },
      child: const Text("OK"),
    );

    AlertDialog alert = AlertDialog.adaptive(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
