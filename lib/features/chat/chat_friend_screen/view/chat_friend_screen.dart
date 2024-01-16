import 'package:flutter/material.dart';
import 'package:prj/assets/styles/text_styles.dart';
import 'package:prj/features/chat/chat_friend_screen/widgets/reciever_message_widget.dart';
import 'package:prj/features/chat/chat_list_screen/chat.dart';
import 'package:prj/models/message_model.dart';

import '../widgets/sender_message_widget.dart';

class ChatPage extends StatefulWidget{
  final ChatMember chatMember;
  ChatPage({required this.chatMember});

  @override
  State<StatefulWidget> createState() => _ChatPageState(chatMember: chatMember);
}

class _ChatPageState extends State<ChatPage>{
  final ChatMember chatMember;
  _ChatPageState({required this.chatMember});

  final TextEditingController _textController = TextEditingController();
  List<Message> _messages = [];

  void _handleSubmitted(String text) {
    if (text.isEmpty)
      return;
    setState(() {
        _messages.add(
          Message(
            text: text,
            date: DateTime.now())
        );
      });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: (){ Navigator.pop(context);},
            icon: Icon(
              Icons.navigate_before,
              size: iconButtonSize,
            )
          ),
          backgroundColor: const Color.fromARGB(255, 77, 139, 83),
          surfaceTintColor: const Color.fromARGB(255, 77, 139, 83),
          elevation: 0,
          title: Text(chatMember.name,
            style: TextStyles.appBarTitleStyle,
          ),
          actions: <Widget>[],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 77, 139, 83)
          ),
          child:  Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
                          color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
            ),
            child: GestureDetector(
              // Обработчик касания для скрытия клавиатуры при нажатии на область сообщений
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                    // Виджет для отображения сообщений (вы можете добавить список сообщений сюда)
                  Expanded(
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        // if (sender){
                        //   SenderMessageWidget
                        // }
                        // else{
                        //   RecieverMessageWidget
                        // }
                        return SenderMessageWidget(_messages[index].text);
                      },
                    ),
                  ),
                _buildBottomChatArea()
                ],
              ),
            )
          )
        ),
      )
    );
  }

   Widget _buildBottomChatArea() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          // Поле ввода текста
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width))
              ),
              child:  TextField(
                controller: _textController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Введите сообщение...',
                ),
              ),
            )
          ),
          // Кнопка отправки
          Container(
            height: MediaQuery.of(context).size.width * 0.12,
            width: MediaQuery.of(context).size.width * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(40)
            ),
            child: IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
              ),
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
          )
        ],
      ),
    );
  }

  Widget _buildMessage(String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        children: [
          Expanded(
            child:  Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 146, 146, 146),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: Colors.black
        )
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    )
          )
        ],
      ),
    );
    
  }
}
