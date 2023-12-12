import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prj/features/routes/route_screen/widgets/route_tabbar.dart';
import 'package:prj/models/route_model.dart';
import 'package:prj/assets/styles/text_styles.dart';

Widget buildRow(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
  List<Widget> containers = [];
  for (String text in snapshot.data?.docs[index].get('categories')) {
    containers.add(
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(255, 150, 197, 156)
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(8,3,8,3),
          child: Text(text,
            style: const TextStyle(
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

void addData() async{
  await FirebaseFirestore.instance.collection('/Routes').add({
    'name': 'Красная площадь',
    'time': 47,
    'countSteps': 8740,
    'distance' : 25,
    'countComments': 65,
    'categories': [
      'Архитектура', 'Военное дело'
    ],
    'description' : 'Описание красной площади',
    'img' : null
});
}


class RoutePage extends StatelessWidget{
  const RoutePage({super.key, required this.index});

  final int index;

  Widget build(BuildContext context) {
    double iconButtonSize = MediaQuery.of(context).size.width * 0.08;
    return //StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('/Routes').snapshots(), 
    //   builder: builder)
    SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
          title: Text("Маршрут",
            style: TextStyles.appBarTitleStyle
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: const Color.fromARGB(255, 77, 139, 83),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 243),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.08), topRight: Radius.circular(MediaQuery.of(context).size.width * 0.08))
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('/Routes').snapshots(), 
              builder: (context, snapshot){
                if (!snapshot.hasData) {
                  return const Text('Нет записей');
                }
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.network(
                          "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          fit: BoxFit.cover,
                        )     
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 0),
                            child: Text(
                              snapshot.data?.docs[index].get('name'),
                              style: TextStyles.routeTitleStyle
                              )
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${snapshot.data?.docs[index].get('time')} мин  ${snapshot.data?.docs[index].get('countSteps')} шага (-ов)',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.routeSubtitleStyle
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Color.fromARGB(255, 249, 194, 98)),
                              SizedBox(width: 4.0),
                              Text('4.5'),
                              Text('   ${snapshot.data?.docs[index].get('countComments')} оценок',
                                style: TextStyles.routeSubtitleStyle
                              ),
                            ],
                          ),
                        ],
                      ),
                      const RouteTabBar(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0,0,0,10),
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            buildRow(index, snapshot),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.21,
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              //height: 103,
                              child: Text('${snapshot.data?.docs[index].get('description')}',
                                overflow: TextOverflow.ellipsis, // Обрезать текст, если не хватает места
                                maxLines: 8,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
                            color: Color.fromARGB(255, 150, 197, 156),
                            width: 1.0,
                          ),
                          color: Colors.white
                        ),
                        child: TextButton(
                          onPressed: (){
                            addData();
                          }, 
                          child: const Text(
                            'Начать',
                            style: TextStyle(
                              color:Color.fromARGB(255, 77, 139, 83),
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                );
              }
            )
          ),
        ),
      ),
    );
  }
}