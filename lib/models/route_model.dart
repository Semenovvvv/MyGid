import 'package:flutter/material.dart';

class Route{
  String name;
  int time;
  int countSteps;
  int distance;
  int countComments;
  List<String> categories = [];
  String? description = "";
  Image? img;

  Route(
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

List<Route> routes = [
  Route(name: 'Маршрут по Волге', time: 15, countSteps: 3000, distance: 3, countComments: 15, categories: ['Архитектура'],
    img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
    description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
  ),
  Route(name: 'Чебоксарский залив', time: 19, countSteps: 3460, distance: 7, countComments: 18, categories: ['История', 'Военное дело'], 
    img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
    description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
  ),
  Route(name: 'Красная площадь', time: 47, countSteps: 8740, distance: 25, countComments: 65, categories: ['Архитектура', 'Военное дело'], 
    img: Image.network("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200690_6-mykaleidoscope-ru-p-stolitsa-chuvashii-cheboksari-vkontakte-7.jpg"),
     description: 'Тенденция познания истории своей большой и малой Родины, возникшая в последние годы в нашей стране (не без участия музейного и туристического сообщества), имеет в своей основе не только экономические, но и социально значимые цели, такие как развитие чувства патриотизма и уважение к нашему общему культурно-историческому наследию, желание ее сохранить.'
  ),
  // Добавьте свои маршруты сюда
];