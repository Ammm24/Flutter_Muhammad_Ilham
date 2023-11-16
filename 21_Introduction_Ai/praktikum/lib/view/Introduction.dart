import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => IntroductionState();
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hallo selamat datang di website saya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              child: const Text('Selanjutnya'),
            ),
          ],
        ),
      ),
    );
  }
}
