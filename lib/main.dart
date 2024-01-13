import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prj/features/auth/signIn/signIn.dart';

import 'package:prj/features/chat/chat_screen/chat.dart';
import 'package:prj/features/friends/friends_screen/friends.dart';
import 'package:prj/features/home/home_screen/home.dart';
import 'package:prj/features/profile/profile_screen/profile.dart';
import 'package:prj/features/routes/routes_screen/routes.dart';

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

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City walker',
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/routes':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Routes(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
            );
          case '/home':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Home(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
          );
          case '/profile':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Profile(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
            );
          case '/friends':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Friends(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
            );
          case '/chat':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const Chat(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
            );
          case '/':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const SignIn(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Убираем анимацию
                return child;
              },
              settings: settings,
              transitionDuration: const Duration(seconds: 0),
            );
          default:
            return null;
        }
      },
    );
  }
} 