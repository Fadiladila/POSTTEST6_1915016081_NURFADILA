import 'package:flutter/material.dart';

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // title: const Text("Informasi"),
        content: Text(pesan),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          )
        ],
      );
    },
  );
}