import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:prj/features/auth/signIn/widgets/signIn_widget.dart';
import 'package:prj/features/auth/signIn/widgets/signUp_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        body: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.6),
              child: Container(
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(70))
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedButtonIndex = 0;
                              });
                            }, 
                            child: Text(
                              'Вход',
                              style: GoogleFonts.montserrat(
                                color: selectedButtonIndex == 0 ? Colors.black : Color.fromARGB(255, 192, 192, 192),
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ),
                          TextButton(
                            onPressed: (){
                              setState(() {
                                selectedButtonIndex = 1;
                              });
                            }, 
                            child: Text(
                              'Регистрация',
                              style: GoogleFonts.montserrat(
                                color: selectedButtonIndex == 1 ? Colors.black : Color.fromARGB(255, 192, 192, 192),
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    IndexedStack(
                      index: selectedButtonIndex,
                      children: [
                        SignInForm(),
                        SignUpForm(),
                      ],
                    ),
                  ],
                )
              ),
            ),
          ],
        )
      )
    );
  }
}