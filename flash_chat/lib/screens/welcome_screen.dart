import 'package:flash_chat/Components/rounded_buttons.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
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
                    height: controller.value * 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash_Chat',
                        textStyle: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        )),
                  ],
                  totalRepeatCount: 1,
                ),
              ],
            ),
              SizedBox(
              height: 48.0,
            ),
            UiButtons(color: Colors.lightBlueAccent, text: 'Log In', fn: (){Navigator.pushNamed(context, LoginScreen.routeName);},),
          
            UiButtons(color: Colors.blueAccent, text: 'Register', fn: (){Navigator.pushNamed(context, RegistrationScreen.routeName);}),
            
          ],
        ),
      ),
    );
  }
}