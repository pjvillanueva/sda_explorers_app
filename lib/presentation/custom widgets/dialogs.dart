import 'package:flutter/material.dart';

Future<List<String>?> showRawTextInputDialog(BuildContext context) {
  final rawTextEditingController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
              title: const Text('Input raw lessons'),
              contentPadding: const EdgeInsets.all(20.0),
              children: [
                TextFormField(
                    maxLines: 10, controller: rawTextEditingController),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        print('${rawTextEditingController.text}');
                        Navigator.pop(context, [rawTextEditingController.text]);
                      },
                      child: const Text('SAVE'))
                ])
              ]));
}
