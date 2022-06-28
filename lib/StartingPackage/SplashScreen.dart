import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OnBoarding.dart';




class SplashScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return
      AnimatedSplashScreen(
        splash: Column(

          children: [Image.asset('assets/logo_anim.gif'),SizedBox(height: 20),
            //Text("Covalent Trivia" ,style :TextStyle(fontSize: 25,color: Color(0xffBFD1FF),fontFamily: 'fonts/ubuntu_bold.ttf',fontWeight: FontWeight.bold))
         ],
        ),
        backgroundColor: Color(0xff303646),
        splashIconSize: 250,
        duration: 5500,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: OnBoarding());
  }





}
