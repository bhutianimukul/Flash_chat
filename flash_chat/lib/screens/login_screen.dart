import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Components/rounded_buttons.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const routeName='/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  var _showSpinner=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     void  showDialogScreen(){
  showDialog(context: context, builder: (ctx)=>AlertDialog(
    content: Text('Please Try Again'),
    title: Text('Authentication Failed ' , style: TextStyle(fontSize: 40),),
    actions: [TextButton(onPressed: ()=>Navigator.pop(ctx), child: Text('OK' ,style: TextStyle(fontSize: 20),) )],
  ));
  }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: _showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email=value;
                    //Do something with the user input.
                  },style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                 
                    hintText: 'Enter your email',hintStyle:  TextStyle(color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    password=value;
                    //Do something with the user input.
                  },
obscureText: true,                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter your password ",hintStyle:  TextStyle(color: Colors.black),
                  
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                  UiButtons(text: 'Log In', fn: ()async{
try{
  setState(() {
      _showSpinner=true;
    });
final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
setState(() {
  
  _showSpinner=false;
});
User loguser=user.user;
//print(loguser.email);
if(user!=null){
  Navigator.pushReplacementNamed(context, ChatScreen.routeName , arguments: loguser);

}
}
catch(error){
  showDialogScreen();
  setState(() {
  
  _showSpinner=false;
});
}




                  } , color: Colors.lightBlueAccent,)
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
