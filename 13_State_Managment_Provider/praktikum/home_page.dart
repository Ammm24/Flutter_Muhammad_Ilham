import 'package:flutter/material.dart';
import 'package:tugas_weekly_1/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contact = List.empty(growable: true);
  
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contact List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Nama Contact',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: contactController,
                keyboardType: TextInputType.number,
                maxLength: 15,
                decoration: const InputDecoration(
                    hintText: 'Nomor Contact',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contact.add(Contact(name: name, contact: contact));
                        });
                      }
                      //
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       //
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contact[selectedIndex].name = name;
                          contact[selectedIndex].contact = contact;
                          selectedIndex = -1;
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
              contact.isEmpty
                  ? const Text(
                      'No contact',
                      style: TextStyle(fontSize: 22),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: contact.length,
                        itemBuilder: (context, index) => getRow(index),
                      ),
                    )
            ],
          ),
        ));
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.purpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contact[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contact[index].contact)
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contact[index].name;
                    contactController.text = contact[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: () {
                    //
                    setState(() {
                      contact.removeAt(index);
                    });
                    //
                  },
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
