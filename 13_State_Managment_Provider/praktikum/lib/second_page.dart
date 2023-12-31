import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/contact_provider.dart'; // Assuming you have a file named 'contact_provider.dart'
import 'package:praktikum/list_galeri.dart';
import 'package:praktikum/main.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();

  int editingIndex = -1;

  RegExp namePattern = RegExp(r"^[A-Z][a-z]+( [A-Z][a-z]+)+$");
  RegExp get noHpRegex =>
      RegExp(r"^(\+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$");

  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  late ContactProvider _contactProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contactProvider = Provider.of<ContactProvider>(context);
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void dispose() {
    namaController.dispose();
    noHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> contact = _contactProvider.contacts
        .map((contact) => {
              'title': contact.title,
              'subtitle': contact.subtitle,
            })
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.phone_android_rounded),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Create New Contacts",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const Text(
                          "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: namaController,
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    hintText: "Insert Your Name",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE7E0EC)),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama harus di isi';
                    } else if (value.isNotEmpty) {
                      if (!namePattern.hasMatch(value)) {
                        return 'nama harus diawali kapital, minimal 2 kata';
                      }
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: noHpController,
                  decoration: InputDecoration(
                    label: const Text("Nomor"),
                    hintText: "+62 ...",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE7E0EC)),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No HP harus di isi';
                    } else if (value.isNotEmpty) {
                      if (!noHpRegex.hasMatch(value)) {
                        return 'No HP diawali 08, dan minimal 10 angka';
                      }
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: addContacts,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 122, 1, 192),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => showOptions(),
                      child: const Text("Pick & Open File"),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text("List Contacts"),
                ),
              ),
              const SizedBox(height: 24),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: contact.length,
                itemBuilder: (context, index) {
                  final data = contact[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 252, 251, 252),
                      child: Text(
                        "${data['title']?[0]}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 121, 140, 252)),
                      ),
                    ),
                    title: Text("${data['title']}"),
                    subtitle: Text("${data['subtitle']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                editingIndex = index; // Masuk ke mode edit
                                namaController.text = data['title'] ?? "";
                                noHpController.text = data['subtitle'] ?? "";
                              });
                            },
                            child: const Icon(Icons.edit)),
                        const SizedBox(width: 16),
                        GestureDetector(
                            onTap: () {
                              deleteContact(index);
                            },
                            child: const Icon(Icons.delete)),
                      ],
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

  File? _selectedFile;

  void _openFileExplorer() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);

      setState(() {
        _selectedFile = file;
      });
    } else {
      setState(() {
        _selectedFile = null;
      });
    }
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                      title: '',
                    ),
                  ));
            },
            child: const Text(
              'contact',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            child: const Text(
              'Galeri',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListGaleri(),
                  ));
            },
          ),
        ],
      ),
    );
  }

  addContacts() {
    String name = namaController.text;
    String number = noHpController.text;

    debugPrint(name);
    debugPrint(number);

    if (editingIndex != -1) {
      _contactProvider.editContact(
        editingIndex,
        Contact(title: name, subtitle: number),
      );
      setState(() {
        editingIndex = -1; // Keluar dari mode edit
      });

      namaController.clear();
      noHpController.clear();
    } else {
      _contactProvider.addContact(Contact(title: name, subtitle: number));
      namaController.clear();
      noHpController.clear();
    }
  }

  deleteContact(int index) {
    _contactProvider.deleteContact(index);
  }
}

class Contact {
  final String title;
  final String subtitle;

  Contact({required this.title, required this.subtitle});
}
