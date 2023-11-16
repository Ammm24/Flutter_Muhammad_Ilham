import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget(title: 'ChatBot'));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required String title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyWidget(title: 'MaterialApp'),
    );
  }
}
