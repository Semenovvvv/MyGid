import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prj/assets/styles/text_styles.dart';
import 'package:prj/features/routes/route_screen/view/route_screen.dart';
import 'package:prj/widgets/navigation_bar.dart';
import 'package:prj/models/route_model.dart';

class Routes extends StatefulWidget {
  const Routes({ Key? key }) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  var index = 1;

  Widget buildRow(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Widget> containers = [];
    for (String text in snapshot.data?.docs[index].get('categories')) {
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
      //scrollDirection: Axis.horizontal,
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
          title: Text("Маршруты",
            style: TextStyles.appBarTitleStyle
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
                      color: Color.fromARGB(255, 243, 243, 243),
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
                  // Извлечение данных с БД Firestore
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('/Routes').snapshots(), 
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
                    {
                      if (!snapshot.hasData) {
                        return const Text('Нет записей');
                      }
                      return  ListView.builder(
                        itemCount: snapshot.data?.docs.length,
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
                                  snapshot.data?.docs[index].get('name'),
                                  //routes[index].name,
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
                                              '${snapshot.data?.docs[index].get('time')} мин  ${snapshot.data?.docs[index].get('countSteps')} шага (-ов)',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.star, color: Color.fromARGB(255, 249, 194, 98)),
                                                SizedBox(width: 4.0),
                                                Text('4.5'),
                                                Text('   ${snapshot.data?.docs[index].get('countComments')} оценок'), // Замените на свое число отзывов
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    
                                    // Добавляем список категорий
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: buildRow(index, snapshot)
                                    ),
                                  ],
                                ),
                                onTap: (){
                                  Navigator.push(context, 
                                                PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => RoutePage(index: index),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = Offset(0.0, 1.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                              ),
                            ]),
                          );
                        },
                      );
                    },
                  ),
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
