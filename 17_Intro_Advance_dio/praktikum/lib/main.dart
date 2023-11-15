import 'package:flutter/material.dart';
import 'package:praktikum/widget/Bear.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Danusan HMIF',
      home: DiceBear(),
    );
  }
}
