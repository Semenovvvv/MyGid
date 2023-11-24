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

class Routes extends StatefulWidget {
  const Routes({ Key? key }) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  var index = 1;
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
          margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
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
    double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: (){ Navigator.pop(context);},
            icon: Icon(
              Icons.navigate_before,
              size: iconButtonSize,
            )
          ), 
          backgroundColor: const Color.fromARGB(255, 77, 139, 83),
          surfaceTintColor: const Color.fromARGB(255, 77, 139, 83),
          elevation: 0,
          title: const Text("Маршруты",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list_alt,
                size: iconButtonSize,
                color: Colors.white,
                ),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(
                Icons.tune_outlined,
                size: iconButtonSize,
                color: Colors.white,
                ),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: const Color.fromARGB(255, 77, 139, 83),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 243),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                     border: Border.all(
                      color: Color.fromARGB(255, 194, 194, 194),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[200],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search,
                        color: Color.fromARGB(255, 194, 194, 194)
                      ),
                      hintText: 'Введите название...',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 194, 194, 194)
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
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
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
