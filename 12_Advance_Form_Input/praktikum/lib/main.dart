import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage(
    title: '',
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    "assets/Alterra.png",
    "assets/Uciha.png",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Column(
            children: [
              // Welcome section
              const Padding(
                padding: EdgeInsets.all(10.90),
                child: Text(
                  'Welcome to MyApp!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Galeri gambar
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Tampilkan gambar pada bottomsheet
                      showModalBottomSheet(
                        context: context,
                        // ignore: avoid_unnecessary_containers
                        builder: (context) => Container(
                          child: Image.network(images[index]),
                        ),
                      );

                      // Tampilkan gambar pada dialog saat ditekan
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Tampilkan Gambar'),
                          content: Image.network(images[index]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Tidak'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Buka halaman baru
                                Navigator.pushNamed(context, '/halaman-baru');
                              },
                              child: Text('Ya'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Card(
                      child: Image.network(images[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
