import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final List<Contact> contacts = [];

  int editingIndex = -1;

  RegExp namePattern = RegExp(r"^[A-Z][a-z]+( [A-Z][a-z]+)+$");
  RegExp get noHpRegex =>
      RegExp(r"^(\+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$");

  final Dio _dio = Dio();

  @override
  void dispose() {
    namaController.dispose();
    noHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> contact = contacts
    //     .map((contact) => {
    //   'title': contact.title,
    //   'subtitle': contact.subtitle,
    // })
    //     .toList();

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
                        backgroundColor: Color.fromARGB(255, 122, 1, 192),
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
              // Center(
              //   child: Column(
              //     children: [
              //       ElevatedButton(
              //         onPressed: () => showOptions(),
              //         child: const Text("Pick & Open File"),
              //       ),
              //     ],
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text("List Contacts"),
                ),
              ),
              const SizedBox(height: 24),
              // ...

              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 252, 251, 252),
                      child: Text(
                        "${contact.title}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 121, 140, 252),
                        ),
                      ),
                    ),
                    title: Text("${contact.title}"),
                    subtitle: Text("${contact.body}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            updatePost();
                            // setState(() {
                            //   editingIndex = index; // Masuk ke mode edit
                            //   namaController.text = contact.title;
                            //   noHpController.text = contact.body;
                            // });
                          },
                          child: const Icon(Icons.edit),
                        ),
                        const SizedBox(width: 16),
                        // GestureDetector(
                        //   onTap: () {
                        //     deleteContact(contact.id);
                        //   },
                        //   child: const Icon(Icons.delete),
                        // ),
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

  // File? _selectedFile;
  //
  // void _openFileExplorer() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     final file = File(result.files.single.path!);
  //
  //     setState(() {
  //       _selectedFile = file;
  //     });
  //   } else {
  //     setState(() {
  //       _selectedFile = null;
  //     });
  //   }
  // }

  // Future showOptions() async {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => CupertinoActionSheet(
  //       actions: [
  //         CupertinoActionSheetAction(
  //           onPressed: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => const MyHomePage(
  //                     title: '',
  //                   ),
  //                 ));
  //           },
  //           child: const Text(
  //             'contact',
  //             style: TextStyle(
  //               fontSize: 20,
  //             ),
  //           ),
  //         ),
  //         CupertinoActionSheetAction(
  //           child: const Text(
  //             'Galeri',
  //             style: TextStyle(
  //               fontSize: 20,
  //             ),
  //           ),
  //           onPressed: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => ListGaleri(),
  //                 ));
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  addContacts() async {
    String name = namaController.text;
    String number = noHpController.text;

    debugPrint(name);
    debugPrint(number);

    if (editingIndex != -1) {
      setState(() {
        contacts[editingIndex] = Contact(title: name, body: number);
        editingIndex = -1; // Keluar dari mode edit
      });
      namaController.clear();
      noHpController.clear();
    } else {
      Contact newContact = Contact(title: name, body: number);

      // Mengirim permintaan POST ke API
      try {
        Response response = await _dio.post(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
          data: newContact.toJson(), // Gunakan metode toJson pada model Contact
        );
        namaController.clear();
        noHpController.clear();

        // Handle respons sesuai kebutuhan
        print('Response status: ${response.statusCode}');
        print('Response data: ${response.data}');
      } catch (error) {
        // Handle error sesuai kebutuhan
        print('Error: $error');
      }

      setState(() {
        contacts.add(newContact);
      });
    }
  }

  Future<void> updatePost() async {
    try {
      // Request body
      Map<String, dynamic> requestBody = {
        "id": 1,
        "title": "foo",
        "body": "bar",
      };

      // Mengirim permintaan PUT ke API
      Response response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: requestBody,
      );
      namaController.text = response.data['title'].toString();
      noHpController.text = response.data['body'].toString();

      // Handle respons sesuai kebutuhan
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (error) {
      // Handle error sesuai kebutuhan
      print('Error: $error');
    }
  }

  // printContacts() {
  //   List<Map<String, String>> formattedContacts = contacts
  //       .map((contact) => {
  //     'title': contact.title,
  //     'subtitle': contact.subtitle,
  //   })
  //       .toList();
  //
  //   String jsonString = formattedContacts.toString();
  //   debugPrint(jsonString);
  // }

  deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }
}

// class Contact {
//   final String title;
//   final String subtitle;
//
//   Contact({required this.title, required this.subtitle});
// }