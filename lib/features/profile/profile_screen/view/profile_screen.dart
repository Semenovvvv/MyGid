import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Route{
  String name;
  int time;
  int countSteps;
  int distance;
  int countComments;
  List<String> categories = [];
  Route(
    {required this.name, 
      this.time = 0, 
      this.countSteps = 0, 
      this.distance = 0, 
      this.countComments = 0,
      required this.categories}
  );
}

class Profile extends StatefulWidget{
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class ProfileTabBar extends StatefulWidget {
  @override
  _ProfileTabBarState createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // change height here

        child: AppBar(
          automaticallyImplyLeading: false, // убираем стрелочку
          backgroundColor: Color.fromARGB(255, 231, 231, 231),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Color.fromARGB(255, 51, 50, 50), // цвет текста выбранного таба
            unselectedLabelColor: Color.fromARGB(255, 194, 194, 194), // цвет текста невыбранного таба
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 255, 255, 255)),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'Маршруты',
              ),
              Tab(
                text: 'Фотографии',
              ),
              Tab(
                text: 'Отзывы',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileState extends State<Profile> {
  Color _color = Colors.blue;

  List<Route> routes = [
    Route(name: 'Маршрут по Волге', time: 15, countSteps: 3000, distance: 3, countComments: 15, categories: ['Архитектура']),
    Route(name: 'Чебоксарский залив', time: 19, countSteps: 3460, distance: 7, countComments: 18, categories: ['История', 'Военное дело']),
    Route(name: 'Красная площадь', time: 47, countSteps: 8740, distance: 25, countComments: 65, categories: ['Архитектура', 'Военное дело']),
    // Добавьте свои маршруты сюда
  ];

  Widget buildRow(int index) {
    List<Widget> containers = [];
    for (String text in routes[index].categories) {
      containers.add(
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(255, 150, 197, 156)
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(8,3,8,3),
            child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
          )
        )
      );
    }
    return Row(
      children: containers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color.fromARGB(255, 243, 243, 243),
        body: SingleChildScrollView(
            child:Stack(
              children: [
                Column(
              children: [
                //шапка
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 100, 13),
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
                  child: Stack(
                    children: [
                      //контейнер, который около аватарки
                      Align(
                        alignment: Alignment.bottomLeft,
                        child:    Container(
                        height: MediaQuery.of(context).size.height * 0.115,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 246, 245, 244),
                          borderRadius: BorderRadius.only(topLeft:  Radius.circular(32) )
                        ),
                        
                      ),
                      ),
                     
                      Align(
                        alignment: Alignment.bottomRight,
                        child:   Container(
                        height:  MediaQuery.of(context).size.height * 0.115,
                        width:  MediaQuery.of(context).size.width * 0.6,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 246, 245, 244),
                          borderRadius: BorderRadius.only(topRight:Radius.circular(32) )
                        ),
                        child:  Align(
                          alignment:  Alignment.bottomLeft,
                          child:Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Сергей Кузьмин',
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color:Color.fromARGB(255, 51, 50, 50),
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
                              TextButton(
                                onPressed: () {
                                  // Обработчик нажатия на кнопку
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.77, 50),
                                  backgroundColor: const Color.fromARGB(255, 77, 139, 83),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                  )
                                  
                                ),
                                child: const Text(
                                  'Подписаться',
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
                                color: Color.fromARGB(255, 194, 194, 194),
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ProfileTabBar(),
                  ),
                ),
                //список маршрутов
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(243, 243, 243, 243),
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: routes.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.fromLTRB(16,0, 16, 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child:  Column(children: [
                              ListTile(
                                title: Text(
                                  routes[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${routes[index].time} мин  ${routes[index].countSteps} шага (-ов)',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.star, color: Color.fromARGB(255, 249, 194, 98)),
                                                SizedBox(width: 4.0),
                                                Text('4.5'),
                                                Text('   ${routes[index].countComments} оценок'), // Замените на свое число отзывов
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    
                                    // Добавляем список категорий
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: buildRow(index)
                                    ),
                                  ],
                                ),
                                onTap: (){},
                              ),
                            ]),
                          );
                        },
                      )
                    ),
                    ),
                    
                    
                  ],
                ),
                
                
              ],
            ),
            //аватарка
            Positioned(
              top:70,
              left: 35,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(246, 245, 244, 1.0),
                ),
              ),
            ),
            Positioned(
              top:75,
              left: 40,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(0, 91, 91, 1.0),
                  //image: DecorationImage(image: AssetImage("lib/assets/images/bg_profile.png"), fit: BoxFit.cover),
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