import 'package:flutter/material.dart';

class ExampleWidescreen extends StatelessWidget {
  const ExampleWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Ini Widescreen"),),
      body: Center(child: Text("Ini Contoh Widescreen"),),
    );
  }
}