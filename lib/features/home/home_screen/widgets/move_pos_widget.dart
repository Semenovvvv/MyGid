import 'package:flutter/material.dart';

class MovePosition extends StatefulWidget {
  const MovePosition({ Key? key }) : super(key: key);

  @override
  State<MovePosition> createState() => _MovePosition();
}

class _MovePosition extends State<MovePosition> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.85, 0.6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child:  IconButton(
          color: Colors.grey,
          onPressed: (){
            
          },
          icon: Icon(Icons.navigation_outlined), iconSize:  MediaQuery.of(context).size.width * 0.08),
      )
    );
  }
}