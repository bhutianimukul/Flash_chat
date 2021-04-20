
import 'package:flash_chat/Components/rounded_buttons.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
   static const routeName='/register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 
  var _showSpinner=false;
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
 final  emailController=TextEditingController();
  final  PassController=TextEditingController();
   final  ImageController=TextEditingController();

   //ToDO
  @override
  Widget build(BuildContext context) {
     void  showDialogScreen(){
  showDialog(context: context, builder: (ctx)=>AlertDialog(
    content: Text('Please Try Again'),
    title: Text('Authentication Failed ' , style: TextStyle(fontSize: 40),),
    actions: [TextButton(onPressed: ()=>Navigator.pop(ctx), child: Text('OK' ,style: TextStyle(fontSize: 20),) )],
  ));
  }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD (
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
              ),Center(
                child: CircleAvatar(
                  child: Text('Hello'),
                ),
              ),
              TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',hintStyle:  TextStyle(color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
              controller: PassController,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
style: TextStyle(color: Colors.black),
textAlign: TextAlign.center,
obscureText: true,

                decoration: InputDecoration(
            
                  hintText: 'Enter your password',
                  hintStyle:  TextStyle(color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              UiButtons(text: 'Register', fn: ()async{
     if(emailController.text.isEmpty|| PassController.text.isEmpty){
       showDialogScreen();
     }else{
                try{ 
                  setState(() {
                                      _showSpinner=true;
                                    });
              final newUser=await  _auth.createUserWithEmailAndPassword(email: email, password: password);
        setState(() {
                                      _showSpinner=false;
                                    });
        User loguser=newUser.user;
print(loguser.email);
            if(newUser!=null){
              Navigator.pushReplacementNamed(context, ChatScreen.routeName , arguments: loguser);
            }
              }catch(error){
              
             showDialogScreen();
             setState(() {
                              _showSpinner=false;
                            });
              }
              }} , color: Colors.blueAccent,)
                 
            ],
          ),
        ),
      ),
    );
  }
}
