import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff393E46),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            size: 40, //change size on your need
            color: Colors.white, //change color on your need
          ),
          backgroundColor: const Color(0xFF222831),
          title: const Text(
            'Flutter Demo',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        drawer: SizedBox(
          height: double.infinity,
          child: Drawer(
            backgroundColor: const Color(0xFF222831),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 26,
                top: 46,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      // Navigate to Contact Us page
                      Navigator.pushNamed(context, '/contact_us');
                    },
                    title: const Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    onTap: () {
                      // Navigate to About Us page
                      Navigator.pushNamed(context, '/about_us');
                    },
                    title: const Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Tulis kode untuk memproses login di sini
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff393E46),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
