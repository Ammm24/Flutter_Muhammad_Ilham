import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pesanController = TextEditingController();

  void _submitForm() {
    // Validasi form
    if (_formKey.currentState!.validate()) {
      // Dapatkan data dari form
      final namaLengkap = _namaLengkapController.text;
      final lastName = _lastNameController.text;
      final email = _emailController.text;
      final pesan = _pesanController.text;

      // Tampilkan alert
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Data Form'),
          content: Text(
            'Nama Lengkap: $namaLengkap\n'
            'Last Name: $lastName\n'
            'Email: $email\n'
            'Pesan: $pesan',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // TextField untuk nama lengkap
                  Padding(
                    padding: const EdgeInsets.all(10.90),
                    child: TextFormField(
                      controller: _namaLengkapController,
                      decoration: InputDecoration(
                        hintText: "Nama Lengkap",
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  // TextField untuk last name
                  Padding(
                    padding: const EdgeInsets.all(10.90),
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        labelText: "Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  // TextField untuk email
                  Padding(
                    padding: const EdgeInsets.all(10.90),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  // TextField untuk pesan
                  Padding(
                    padding: const EdgeInsets.all(10.90),
                    child: TextFormField(
                      controller: _pesanController,
                      decoration: InputDecoration(
                        hintText: "Pesan",
                        labelText: "Pesan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // FloatingActionButton untuk submit form
            FloatingActionButton(
              onPressed: _submitForm,
              tooltip: 'Submit',
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
