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
          
            child:Stack(
              children: [
                Column(
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
                      //контейнер, который около аватарки
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:    Container(
                        height: MediaQuery.of(context).size.height * 0.115,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(210, 210, 210, 210)
                        ),
                        
                      ),
                      ),
                     
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:   Container(
                        height:  MediaQuery.of(context).size.height * 0.115,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(243,243,243,243),
                          borderRadius: BorderRadius.only(topLeft:  Radius.circular(32), topRight:Radius.circular(32) )
                        ),
                        child:  Align(
                          
                          alignment:  const Alignment(0.1, 0.1),
                          child:Column(
                            crossAxisAlignment:CrossAxisAlignment.start, 
                            children: [
                              const Text(
                                'Сергей Кузьмин',
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color:Colors.black,
                                ),
                                ),
                              Text(
                                textAlign: TextAlign.left,
                                'г.Чебоксары',
                                style:TextStyle(
                                  fontSize: 12,
                                  color:Colors.black.withOpacity(0.5),
                                ),
                                ),
                                
                            ],
                          )
                        ),
                      ),
                      ),
                    ],
                  ),
                ), 
                //Кнопка подписаться и три точки
                 Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(243, 243, 243, 243)
                              ),
                              padding:const EdgeInsets.symmetric(horizontal: 13.0),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Обработчик нажатия на кнопку
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(320, 50),
                                  backgroundColor: const Color.fromARGB(77, 3, 255, 45) ,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                  )
                                  
                                ),
                                child: const Text(
                                  'Редактировать',
                                  style:TextStyle(
                                    color: Colors.white,
                                  )
                                  ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(231, 231, 231, 231),
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                ),
                                child:IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.more_horiz),
                              )
                              )
                            ],
                          ) ,
                            ),
                          
                          ],
                        )   
                      ),
                  //Маршруты,подпищики,избранное
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Container(
                              height: MediaQuery.of(context).size.height * 0.16,
                              
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(243, 243, 243, 243)
                              ),
                              padding:const EdgeInsets.symmetric(horizontal: 25.0,vertical: 22),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Column(
                                    children: [
                                      Align(  
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Маршруты',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.3),
                                                fontSize:16
                                              ),
                                            ),
                                             const Text(
                                              '193',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  
                                  Column(
                                    children: [
                                      Align(  
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Подписчики',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.3),
                                                fontSize:16
                                              ),
                                            ),
                                             const Text(
                                              '102',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Align(  
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Избранное',
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.3),
                                                fontSize:16
                                              ),
                                            ),
                                             const Text(
                                              '14',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ],
                                
                              ),
                        )
                      ],
                    ),
                  ),
                  //переключалка маршруты, отзывы,фотографии
                  
                  Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 13 ),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(243, 243, 243, 243),
                                
                              ),
                              child:Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2 ),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(231, 231, 231, 231),
                                  borderRadius: BorderRadius.all(Radius.circular(12) )
                                ),
                                child:const Row(
                                  children: [
                                    
                                  ],
                                ),
                              )
                              
                            ),
                          ],
                        )
                      ),
                //список маршрутов
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(243, 243, 243, 243),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top:0),
                        itemCount: 5,
                        separatorBuilder: (context,index) =>  Container(
                          //color: Colors.blue,
                          ),
                          itemBuilder: (context,index){
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                              //padding:const EdgeInsets.all(16), 
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: const BoxDecoration(
                              color: Color.fromARGB(255,255,255,255),
                              borderRadius: BorderRadius.only(topLeft:  Radius.circular(32), topRight:Radius.circular(32),bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32) )
                        ),
                            );
                          },
                        ),
                    ),
                    ),
                    
                    
                  ],
                ),
                
                
              ],
            ),
            //аватарка
            Positioned(
              top:70,
              left: 40,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(243, 243, 243, 1),
                ),
              ),
            ),
            Positioned(
              top:75,
              left: 45,
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey
  ),
                
              ),
            ),
              ],
            )
             
          ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}