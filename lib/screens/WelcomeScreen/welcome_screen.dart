
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../widgets/rounded_buttom.dart';
import '../auth/login_screen.dart';
import '../auth/registor_screen.dart';
import '../home/home_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
    controller!.forward(); //0-----0.5------1



    controller!.addListener(() {
      setState(() {});
      print(animation!.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      // Colors.white, // Colors.red.withOpacity(controller!.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/uni.png'),
                    height: 100,
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Agne',
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Welcome'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonText: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              onPress: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
            ),
            RoundedButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
              },
            ),
            RoundedButton(
              buttonText: 'Skip',
              buttonColor: Colors.blueAccent,
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
            ),
          ],
        ),
      ),
    );
  }
}