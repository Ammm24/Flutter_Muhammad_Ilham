import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          shadowColor: Color.fromARGB(255, 5, 5, 5),
          elevation: 0.2,
          backgroundColor: Color.fromARGB(255, 128, 0, 167),
          title: const Text(
            "Phone Recomendation",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 130,
                ),
                const Text('Budget'),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your budget in IDR'),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Camera (MP)'),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your camera requirement'),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Internal Storage'),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your desired internal storage'),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: const Text(
                    'Get Recommendations',
                    style: TextStyle(),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
