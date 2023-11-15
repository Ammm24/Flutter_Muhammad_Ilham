import 'package:flutter/material.dart';

class ListGaleri extends StatelessWidget {
  ListGaleri({super.key});

  final List<String> imageUrls = [
    'assets/Alterra.png',
    'assets/Uciha.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gridview Example'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Ubah sesuai kebutuhan
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.asset(imageUrls[index].toString()),
          );
        },
      ),
    );
  }
}
