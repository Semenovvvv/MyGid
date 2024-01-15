import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class MapRoute{
  String name;
  int time;
  int countSteps;
  int distance = 0;
  int countComments = 0;
  List<String> categories = [];
  String? description = "";
  Image? img;

  MapRoute(
    {required this.name,
      this.time = 0,
      this.countSteps = 0,
      this.distance = 0,
      this.countComments = 0,
      required this.categories,
      this.description,
      this.img}
  );
}

// List<MapRoute> Maproutes = [
//   MapRoute(name: 'Маршрут по Волге', time: 15, countSteps: 3000, distance: 3, countComments: 15, categories: ['Архитектура'],
//     img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
//     description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
//   ),
//   MapRoute(name: 'Чебоксарский залив', time: 19, countSteps: 3460, distance: 7, countComments: 18, categories: ['История', 'Военное дело'], 
//     img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
//     description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
//   ),
//   MapRoute(name: 'Красная площадь', time: 47, countSteps: 8740, distance: 25, countComments: 65, categories: ['Архитектура', 'Военное дело'], 
//     img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
//      description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
//   ),
// ];

// List<MapRoute> fetchMapRoutes(){
//   var response = getRoutesBody();
//   final List<dynamic> data = json.decode(response.body);
//   // Преобразуйте данные в объекты класса MapRoute
//   List<MapRoute> Maproutes = data.map((routeData) {
//     return MapRoute(
//       name: routeData['Maproute_name'],
//       time: routeData['time_spent'],
//       countSteps: routeData['number_of_steps'],
//       categories: List<String>.from(routeData['short_desc']),
//     );
//   }).toList();

//   return Maproutes;

// }

// Future<http.Response> getRoutesBody() async{
//   final Uri apiUrl = Uri.parse('http://192.168.3.42:8000/api/Maproutes/');
//   final response = await http.get(apiUrl);
//   return response;
// }

// var Maproutes = await fetchMapRoutes();