import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:prj/main.dart';
import 'package:prj/models/registeruser_model.dart';

import 'package:prj/services/auth.dart';

class SignUpForm extends StatelessWidget {
  final Function goToRoute;
  SignUpForm(this.goToRoute, {super.key});

  var _emailController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

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
                hintText: 'Электронная почта',
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
              controller: _usernameController,
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
    String username = _usernameController.text;
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    var regUser = RegistrationModel(
      email: email, 
      username: username, 
      password: password, 
      repeatPassword: repeatPassword);
    var response = Response('', 400);

    if(password == repeatPassword){
      response = await AuthService.registerUser(regUser);
    }
    if (response.statusCode == 201){
      goToRoute(AllRoutes.home);
    }
  }
}