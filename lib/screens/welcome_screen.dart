import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
      upperBound: 1.0,
      vsync: this,
      duration: Duration(seconds: 1),
    );

//    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(animationController);

//    animationController.forward();
    animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse(from: 1.0);
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.addListener(() {
      print(animationController.value);
      setState(() {

      });
    });
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
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 50.0,
                ),
                TypewriterAnimatedTextKit(
                  text: ['FlashChat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: "Login",callback: (){Navigator.pushNamed(context, LoginScreen.id);},),
            RoundedButton(title: "Register", callback: (){Navigator.pushNamed(context, RegistrationScreen.id);},),
          ],
        ),
      ),
    );
  }
}


