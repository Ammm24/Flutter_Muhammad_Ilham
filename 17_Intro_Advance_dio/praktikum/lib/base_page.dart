import 'package:flutter/material.dart';
import 'package:praktikum/contact_page.dart';
import 'package:praktikum/widget/bear.dart';


class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiceBear(),
                    )),
                child: const Text("DiceBear")),
            const SizedBox(height: 24),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactPage(),
                    )),
                child: const Text("Contact")),
          ],
        ),
      ),
    );
  }
}
