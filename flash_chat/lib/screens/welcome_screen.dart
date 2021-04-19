import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
   static const routeName='/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{
  AnimationController controller; 

  Animation animation;
  @override
    void initState() {
  
 controller= AnimationController(duration: Duration(seconds: 1), 
 vsync: this,

 );
 animation=ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
 controller.forward();
 controller.addListener(() {
setState(() { 
});
 });
      super.initState();
    }
    @override
      void dispose() {
    controller.dispose();
    
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value*60,
                  ),
                ),
                Text(
                  'Flash_Chat',
                  style: TextStyle(
                    fontSize: controller.value*40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
     Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    
     Navigator.pushNamed(context, RegistrationScreen.routeName);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
