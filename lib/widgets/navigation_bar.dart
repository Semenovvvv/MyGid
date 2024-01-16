import 'package:flutter/material.dart';
import 'package:prj/main.dart';


class BottomNavBar extends StatefulWidget {
  final Function goToRoute;
  const BottomNavBar(this.goToRoute, {super.key});

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
                widget.goToRoute(AllRoutes.home);
              });},
              icon: Icon(Icons.map_outlined, size: iconSize,)),

          IconButton(
              color: _selectedButtonIndex == 2 ? Colors.black : Colors.grey,
              onPressed: (){setState(() {
                _selectedButtonIndex = 2;
                widget.goToRoute(AllRoutes.routes);
              });},
              icon: Icon(Icons.route_outlined, size: iconSize)),

          IconButton(
              color: _selectedButtonIndex == 3 ? Colors.black : Colors.grey,
              onPressed: (){setState(() {
                _selectedButtonIndex = 3;
                widget.goToRoute(AllRoutes.profile);
              });},
              icon: Icon(Icons.person_outline, size: iconSize)),

          IconButton(
              color: _selectedButtonIndex == 4 ? Colors.black : Colors.grey,
              onPressed: (){setState(() {
                _selectedButtonIndex = 4;
                widget.goToRoute(AllRoutes.friends);
              });},
              icon: Icon(Icons.groups_outlined, size: iconSize)),

          IconButton(
              color: _selectedButtonIndex == 5 ? Colors.black : Colors.grey,
              onPressed: (){setState(() {
                _selectedButtonIndex = 5;
                widget.goToRoute(AllRoutes.chat);
              });},
              icon: Icon(Icons.chat_outlined, size: iconSize)),
        ],
      )
    );
  }
}