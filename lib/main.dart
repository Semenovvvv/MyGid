import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prj/features/auth/signIn/signIn.dart';

import 'package:prj/features/chat/chat_list_screen/chat.dart';
import 'package:prj/features/friends/friends_screen/friends.dart';
import 'package:prj/features/home/home_screen/home.dart';
import 'package:prj/features/profile/profile_screen/profile.dart';
import 'package:prj/features/routes/routes_screen/routes.dart';

class AllRoutes{
  static const String auth = '/';
  static const String home = '/home';
  static const String routes = '/routes';
  static const String profile = '/profile';
  static const String friends = '/friends';
  static const String chat = '/chat';
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDUsPuPxF8nklcqiaGXcNBmAl1qtDTZGvY', 
      appId: '1:580461850498:android:fc1ad2c0f10adca19a699b', 
      messagingSenderId: '580461850498', 
      projectId: 'mygid-13418',
      storageBucket: 'mygid-13418.appspot.com'
    )
  );
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String thisRoute = AllRoutes.auth;
  bool is404 = false;

  void goToRoute(String route){
    setState(() {
      thisRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City walker',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              child: SignIn(goToRoute),
          ),
          if(thisRoute == AllRoutes.home)
            MaterialPage(
              child: Home(goToRoute),
            ),
          if(thisRoute == AllRoutes.routes)
            MaterialPage(
              child: Routes(goToRoute),
            ),
          if(thisRoute == AllRoutes.profile)
            MaterialPage(
              child: Profile(goToRoute),
            ),
          if(thisRoute == AllRoutes.friends)
            MaterialPage(
              child: Friends(goToRoute),
            ),
          if(thisRoute == AllRoutes.chat)
            MaterialPage(
              child: ChatList(goToRoute),
            ),
          if (is404)
            MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('404 Ошибка навигации. Перезагрузите приложение.'),
                ),
              ),
            ),

        ],
          onPopPage: (route, result){
            return route.didPop(result);

          }
      ),
    );
  }
}