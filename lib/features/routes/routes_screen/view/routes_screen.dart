import 'package:flutter/material.dart';
import 'package:prj/widgets/navigation_bar.dart';

class Route{
  String name;
  int time;
  int countSteps;
  int distance;
  int countComments;
  List<String>? categories;
  Route(
    {required this.name, 
      this.time = 0, 
      this.countSteps = 0, 
      this.distance = 0, 
      this.countComments = 0,
      this.categories}
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
    Route(name: 'Маршрут по Волге', time: 15, countSteps: 3000, distance: 25, countComments: 15),
    Route(name: 'Чебоксарский залив', time: 15, countSteps: 3000, distance: 25, countComments: 15),
    Route(name: 'Красная площадь', time: 15, countSteps: 3000, distance: 25, countComments: 15),
    // Добавьте свои маршруты сюда
  ];
  @override
  Widget build(BuildContext context) {
    double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(210, 210, 210, 210),
          surfaceTintColor: Color.fromARGB(210, 210, 210, 210),
          elevation: 0,
          title: Text("Маршруты"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list_alt,
                size: iconButtonSize
                ),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(
                Icons.tune_outlined,
                size: iconButtonSize
                ),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(210, 210, 210, 210),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Поиск',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(
                          routes[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('${routes[index].time} мин  ${routes[index].countSteps} шага (-ов)  ${routes[index].distance} км  ${routes[index].countComments} отзывов'),
                        onTap: (){},
                      );
                    },
                  )
                )
              ],
            ),
          ),
          // child: Column(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25.0),
          //         color: Colors.grey[200],
          //       ),
          //       child: TextField(
          //         decoration: InputDecoration(
          //           prefixIcon: Icon(Icons.search),
          //           hintText: 'Поиск',
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(210, 210, 210, 210),
          //       ),
          //       child: ListView.builder(
          //         itemCount: 3,
          //         itemBuilder: (context, index)
          //         {
          //           return ListTile();
          //         }
          //       ),
          //     )
          //   ],
          // ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}


