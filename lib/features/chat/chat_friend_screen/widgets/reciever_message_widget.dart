import 'package:flutter/material.dart';

class RecieverMessageWidget extends StatelessWidget{
  final String text;
  RecieverMessageWidget(this.text);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
          //padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 95, 139, 145),
              border: Border.all(
                  color: Colors.black,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(1000)
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),
        )
      ],
    );
  }

}