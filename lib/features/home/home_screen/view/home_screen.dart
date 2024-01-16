import 'package:flutter/material.dart';

import 'package:prj/features/home/home_screen/widgets/map_widget.dart';
import 'package:prj/features/home/home_screen/widgets/move_pos_widget.dart';
import 'package:prj/widgets/navigation_bar.dart';


class Home extends StatefulWidget {
  final Function goToRoute;
  const Home(this.goToRoute, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack (
          children: <Widget>[
            MapScreen(),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(widget.goToRoute),
            ),
          ],
        )  
      ),
    );
  }
}