import 'package:flutter/material.dart';

// Failed to launch Pixel_3a_API_33_x86_64: Error: Emulator didn't connect within 60 seconds
// flutter emulators --launch Pixel_3a_API_33_x86_64
void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatefulWidget {
  //1 alwin  juharman
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var dropDownValue = 0;
  var checkValue = false;
  //3 yunita  bima
  var inputControllers = TextEditingController();
  var radioValue = '';
  List data_kontak = [
    {"title": "Kepala SUku", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Bahasa Cinta", "jenis_kelamin": "perempuan"},
    {"title": "Bendahara Sekolah", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Matematika", "jenis_kelamin": "Perempuan"},
    {"title": "Guru Biologi", "jenis_kelamin": "Laki-laki"}
  ]; // data  akan  kita dapatkan dari API temen2 back end
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.grey;
    }

    return MaterialApp(
        //4

        // theme: ThemeData.dark(), // Mengatur tema gelap
        // initialRoute: 'home',
        // routes: {
        //   'home': (_) => HomePage(),
        // },
        home: Scaffold(
      appBar: AppBar(
        title: Text('Muchson App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Center(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Muchson'),
                  Text('Muchson'),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text('List Anak Didik'),
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Perempuan'),
                ],
              ),
              //checkbox simple
              Divider(),
              Row(
                children: [
                  Checkbox(
                      value: checkValue,
                      checkColor: Colors.green, onChanged: (bool? value) {  },;