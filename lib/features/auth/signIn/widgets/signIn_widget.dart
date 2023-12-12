import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prj/services/auth.dart';


class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final AuthService _auth = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child:  Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 4, 0, 0),
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 241,241,241),
            ),
            child: TextField(
              controller: _emailController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Логин',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 194, 194, 194),
                ),
                border: InputBorder.none,
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
            padding: const EdgeInsets.fromLTRB(20, 4, 0, 0),
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 241,241,241),
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Пароль',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 194, 194, 194),
                ),
                border: InputBorder.none,
              ),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                'Забыли пароль?',
                style: GoogleFonts.montserrat(
                  color: Color.fromARGB(255, 105,105,105),
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
                ),
              onPressed: (){},
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 139,139,139),
              ),
              child: TextButton(
                onPressed: (){_signIn(context);},
                child: Text('Войти',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ))
            ),
          )
        ],
      )
    );
  }


  void _signIn(BuildContext context) async{
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user;
    user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null){
      print('Успешный вход');
      Navigator.pushNamed(context, '/home');
    }
    else{
      print('Вход не выполнен');
    }
  }
}
