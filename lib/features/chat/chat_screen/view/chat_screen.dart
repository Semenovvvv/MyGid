import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var index = 1;
  @override
  Widget build(BuildContext context) {
    double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(210, 210, 210, 210),
          surfaceTintColor: Color.fromARGB(210, 210, 210, 210),
          elevation: 0,
          title: Text("Чаты"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit_note_outlined,
                size: iconButtonSize
                ),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: iconButtonSize
                ),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 210, 210, 210),
              ),
              child:  Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index)
                {
                  return ListTile(
                    leading: Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(210, 210, 210, 210),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child:  Icon(Icons.person), 
                    ),
                    title: Text("Иван Иванов"),
                    subtitle: Text(
                      "Привет! Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      overflow: TextOverflow.ellipsis,
                      ),
                    onTap: (){},
                  );
                }
              ),
            ),
          ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}