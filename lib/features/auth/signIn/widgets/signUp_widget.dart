import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:prj/services/auth.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final AuthService _auth = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          Container(
            margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
            padding: const EdgeInsets.fromLTRB(20, 4, 0, 0),
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 241,241,241),
            ),
            child: TextField(
              controller: _repeatPasswordController,
              obscureText: true,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Повторите пароль',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 194, 194, 194),
                ),
                border: InputBorder.none,
              ),
            )
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 139,139,139),
                  width: 2,
                  ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: (){
                  _signUp(context);
                },
                child: Text('Зарегистрироваться',
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 139,139,139),
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
  void _signUp(BuildContext context) async{
    String email = _emailController.text;
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    User? user;

    if(password == repeatPassword){
      user = await _auth.signUpWithEmailAndPassword(email, password);
    }
    if (user != null){
      Navigator.pushNamed(context, '/home');
    }
  }
}