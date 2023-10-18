import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MaterialApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff393E46),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 40, //change size on your need
          color: Colors.white, //change color on your need
        ),
        backgroundColor: const Color(0xFF222831),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      //Tugas Nomor 10
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              // Text(
              //   'This is Materiall App',
              //   style: TextStyle(color: Colors.white),
              // ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "L",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    title: Text(
                      "dfsdfsd",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "fdsfsdf",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      //Tugas nomor 10
      drawer: const Drawer(
        backgroundColor: Color(0xFF222831),
        child: Padding(
          padding: EdgeInsets.only(
            left: 26,
            top: 46,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Setting", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      // Tugas Nomor 10
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
    );
  }
}
