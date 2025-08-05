import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

  final TextEditingController textEditingController;
  final String labeltext;

  const MyWidget({super.key, required this.textEditingController, required this.labeltext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(labeltext)),
      controller: textEditingController,
    );
  }
}