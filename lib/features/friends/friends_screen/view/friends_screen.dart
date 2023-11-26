import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Friends extends StatefulWidget {
  const Friends({ Key? key }) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  var index = 1;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}