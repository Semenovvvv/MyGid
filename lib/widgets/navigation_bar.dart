import 'package:flutter/material.dart';

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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          IconButton(
            color: _selectedButtonIndex == 1 ? Colors.black : Colors.grey,
            onPressed: (){ setState(() {
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
             // Navigator.pushNamed(context, '/friends');
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
