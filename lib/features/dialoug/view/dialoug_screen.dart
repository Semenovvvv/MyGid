import 'package:flutter/material.dart';

class Dialoug extends StatefulWidget{
  const Dialoug({super.key});


  @override
  State<Dialoug> createState() => DialougState();
}
class DialougState extends State<Dialoug> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Диалог'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(

                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Введите сообщение..',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                        color: const Color.fromARGB(255, 236, 0, 0),
                      ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}