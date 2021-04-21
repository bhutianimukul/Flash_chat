import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{ 
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();runApp(

  FlashChat());
}

class FlashChat extends StatefulWidget {

  
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
    User user;
  @override
    void initState() {
      user= FirebaseAuth.instance.currentUser;
   
      // TODO: implement initState
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home:  user != null?  ChatScreen():WelcomeScreen(),
      routes: {
        ChatScreen.routeName:(_)=>ChatScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        RegistrationScreen.routeName:(_)=>RegistrationScreen(),
        WelcomeScreen.routeName:(_)=>WelcomeScreen(),
       
       },
    );
  }
}
