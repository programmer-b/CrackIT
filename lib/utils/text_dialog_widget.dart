import 'package:flutter/material.dart';

import '../app.dart';

Future<T?> showTextDialog<T>(BuildContext context,
        {required String title, required String value}) =>
    showDialog(
        context: context,
        builder: (context) => TextDialogWidget(title: title, value: value));

class TextDialogWidget extends StatefulWidget {
  const TextDialogWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  State<TextDialogWidget> createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Txt(text: widget.title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Txt(
                text: 'Done',
              ))
        ],
      );
}
