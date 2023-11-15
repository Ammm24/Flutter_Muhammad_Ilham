import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const DiceBear());
}

class DiceBear extends StatefulWidget {
  const DiceBear({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DiceBear> {
  String _imageUrl = 'https://api.dicebear.com/7.x/lorelei/svg';

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  void _fetchImage() async {
    var response = await http.get(
        'https://api.dicebear.com/v2/avatars/random?size=100&background=gradient&color=random&style=anime'
            as Uri);
    if (response.statusCode == 200) {
      _imageUrl = response.body;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceBear API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DiceBear API Demo'),
        ),
        body: Center(
          child: _imageUrl.isNotEmpty
              ? Image.network(_imageUrl)
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
