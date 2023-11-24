import 'package:flutter/material.dart';
import 'package:prj/features/chat/chat_screen/view/chat_screen.dart';
import 'package:prj/features/home/home_screen/home.dart';
import 'package:prj/features/profile/profile_screen/profile.dart';
import 'package:prj/features/routes/routes_screen/view/routes_screen.dart';

void main() {
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
          // case '/':
          //   return MaterialPageRoute(
          //     builder: (context) => Home(),
          //     settings: settings,
          //   );
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
          case '/':
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
          // case '/friends':
          //   return PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) => Home(),
          //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //       // Убираем анимацию
          //       return child;
          //     },
          //     settings: settings,
          //     transitionDuration: const Duration(seconds: 0),
          //   );
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
          default:
            return null;
        }
      },
    );
  }
} 