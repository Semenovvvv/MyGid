import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});


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
                //шапка
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
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
                //центр
                Container(
                  decoration: const BoxDecoration(
                          color: Color.fromARGB(210, 228, 228, 228),
                        ),
                  child: Stack(
                    children: [
                      
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:    Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(210, 210, 210, 210)
                        ),
                      ),
                      ),
                     
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:   Container(
                        height:  MediaQuery.of(context).size.height * 0.5,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(229,229,229,229),
                          borderRadius: BorderRadius.only(topLeft:  Radius.circular(32), topRight:Radius.circular(32) )
                        ),
                      ),
                      )
                    ],
                  ),
                ), 
                //низ
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(229, 229, 229, 229)
                      ),
                    ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:   Container(
                      height:  MediaQuery.of(context).size.height * 0.6,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(topLeft:  Radius.circular(32), topRight:Radius.circular(32) )
                      ),
                    ),
                    )
                  ],
                ),
              ],
            )
          ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}