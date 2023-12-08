import 'package:flutter/material.dart';
import 'package:prj/features/chat/chat_screen/view/chat_screen.dart';
import 'package:prj/features/friends/friends_screen/view/friends_screen.dart';
import 'package:prj/features/home/home_screen/home.dart';
import 'package:prj/features/profile/profile_screen/profile.dart';
import 'package:prj/features/routes/routes_screen/view/routes_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedButtonIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.08;
    return Container(
      height:  MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: const Color.fromARGB(
            255, 243, 243, 243)),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          IconButton(
            color: _selectedButtonIndex == 1 ? Colors.black : Colors.grey,
            onPressed: (){setState(() {
              _selectedButtonIndex = 1;
              Navigator.pushNamed(context, '/');
            });},
            icon: Icon(Icons.map_outlined, size: iconSize,)),

          IconButton(
            color: _selectedButtonIndex == 2 ? Colors.black : Colors.grey,
            onPressed: (){setState(() {
              _selectedButtonIndex = 2;
              Navigator.pushNamed(context, '/routes');
            });}, 
            icon: Icon(Icons.route_outlined, size: iconSize)),

          IconButton(
            color: _selectedButtonIndex == 3 ? Colors.black : Colors.grey,
            onPressed: (){setState(() {
              _selectedButtonIndex = 3;
              Navigator.pushNamed(context, '/profile');
            });}, 
            icon: Icon(Icons.person_outline, size: iconSize)),

          IconButton(
            color: _selectedButtonIndex == 4 ? Colors.black : Colors.grey,
            onPressed: (){setState(() {
              _selectedButtonIndex = 4;
              Navigator.pushNamed(context, '/friends');
            });}, 
            icon: Icon(Icons.groups_outlined, size: iconSize)),

          IconButton(
            color: _selectedButtonIndex == 5 ? Colors.black : Colors.grey,
            onPressed: (){setState(() {
              _selectedButtonIndex = 5;
              Navigator.pushNamed(context, '/chat');
            });},
            icon: Icon(Icons.chat_outlined, size: iconSize)),
        ],
      )
    );
  }
}
