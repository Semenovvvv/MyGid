import 'package:flutter/material.dart';
import 'package:prj/assets/styles/text_styles.dart';
import 'package:prj/features/chat/chat_friend_screen/view/chat_friend_screen.dart';
import 'package:prj/widgets/navigation_bar.dart';

class ChatMember{
  Image? leadingImage;
  String name = "No Name";
  String lastMessage = "Привет!";
  
  ChatMember({Image? this.leadingImage, required String this.name, required String this.lastMessage});
}

class ChatList extends StatefulWidget {
  final Function goToRoute;
  const ChatList(this.goToRoute, {super.key});

  @override
  State<ChatList> createState() => _ChatState();
}

class _ChatState extends State<ChatList> {
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
          title: Text("Чаты",
            style: TextStyles.appBarTitleStyle,
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
                    onTap: (){
                      Navigator.push(context, 
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => ChatPage(
                            chatMember: members[index],
                          ),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInQuad;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        )
                      );
                    },
                  );
                }
              ),
            ),
          ),
        bottomNavigationBar: BottomNavBar(widget.goToRoute),
      ),
    );
  }
}