import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
      routes: {
        ChatScreen.routeName:(_)=>ChatScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        RegistrationScreen.routeName:(_)=>RegistrationScreen(),
        WelcomeScreen.routeName:(_)=>WelcomeScreen(),
       
       },
    );
  }
}
