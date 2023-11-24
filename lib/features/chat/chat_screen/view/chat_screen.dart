import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class ChatMember{
  Image? leadingImage;
  String name = "No Name";
  String lastMessage = "Привет!";
  
  ChatMember({Image? this.leadingImage, required String this.name, required String this.lastMessage});
}

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var index = 1;
  List<ChatMember> members = [
    ChatMember(leadingImage: null ,name: "Иванов Иван", lastMessage: "Привет! Как дела?"),
    ChatMember(leadingImage: null ,name: "Петров Петр", lastMessage: "Какой маршрут по Волге лучший?"),
    ChatMember(leadingImage: null ,name: "Сергеев Сергей", lastMessage: "Где можно пофоткаться?"),
    ChatMember(leadingImage: null ,name: "Андреев Андрей", lastMessage: "Привет! Как дела?"),
    ChatMember(leadingImage: null ,name: "Алексеев Алексей", lastMessage: "Привет! Как дела?"),
  ];

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
          title: const Text("Чаты",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit_note_outlined,
                size: iconButtonSize,
                color: Colors.white,
                ),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: iconButtonSize,
                color: Colors.white,
                ),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 77, 139, 83)
              ),
              child:  Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
              ),
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index)
                {
                  return ListTile(
                    leading: Container(
                      height: MediaQuery.of(context).size.width * 0.13,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(210, 210, 210, 210),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child:  const Icon(Icons.person,), 
                    ),
                    title: Text(members[index].name),
                    subtitle: Text(
                      members[index].lastMessage,
                      overflow: TextOverflow.ellipsis,
                      ),
                    onTap: (){},
                  );
                }
              ),
            ),
          ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}