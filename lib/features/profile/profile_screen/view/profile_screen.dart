import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Profile extends StatefulWidget{

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor:Color.fromARGB(213, 210, 210, 210),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(210, 210, 210, 210)
                   ),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          icon: Icon(
                            Icons.navigate_before,
                            size: MediaQuery.of(context).size.width * 0.08,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                          color: Color.fromARGB(210, 210, 210, 210)
                        ),
                  child: Stack(
                    children: [
                      Text("111"),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:    Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(210, 210, 210, 210)
                        ),
                      ),
                      ),
                     
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:   Container(
                        height:  MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:  Radius.circular(30), topRight:Radius.circular(30) )
                        ),
                      ),
                      )
                    
                    ],
                  ),
                ), 
              ],
            )
          ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}