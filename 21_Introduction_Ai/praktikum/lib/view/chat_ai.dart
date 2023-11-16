import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:praktikum/view/Introduction.dart';

void main() {
  runApp(const ChatRoomApp());
}

class ChatRoomApp extends StatelessWidget {
  const ChatRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatRoomScreen(),
    );
  }
}

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Chat Bot Room'),
          backgroundColor: const Color(0x1F171733),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Introduction(),
                    ));
              })),
      body: ChatRoom(),
    );
  }
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> messages = [];
  String _response = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEF0F1),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration:
                        const InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: const Color(0xFF07089F),
                  onPressed: () {
                    setState(() {
                      String message = _messageController.text;
                      if (message.isNotEmpty) {
                        _submitForm(message);
                        _messageController.clear();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm(String userMessage) async {
    String key = '';
    final apiKey = key;
    const apiUrl = 'https://api.openai.com/v1/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(<String, dynamic>{
        "model": "text-davinci-003",
        'prompt':
            "jika ada yang bertanya siapa kamu ?, jawablah saya chat bot yang sangat amat pintar di dunia",
        // "data user akan didapatkan dari variabel berikut $userMessage",
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Respon sukses: ${responseData['choices'][0]['text']}');
      setState(() {
        _response = responseData['choices'][0]['text'];
        messages.add(ChatMessage(
          text: userMessage,
          isUserMessage: true,
        ));
        messages.add(ChatMessage(
          text: _response,
          isUserMessage: false,
        ));
      });
    } else {
      print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage
              ? Color(0xFF07089F)
              : Color.fromRGBO(7, 104, 159, 1),
          borderRadius: isUserMessage
              ? BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
