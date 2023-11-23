import 'package:flutter/material.dart';

import 'package:prj/features/home/home_screen/widgets/map_widget.dart';
import 'package:prj/features/home/home_screen/widgets/move_pos_widget.dart';
import 'package:prj/widgets/navigation_bar.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack (
          children: <Widget>[
            MapScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar()
              ),
            MovePosition()
          ],
        )  
      ),
    );
  }
}