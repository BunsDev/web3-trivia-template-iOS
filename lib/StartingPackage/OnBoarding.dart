import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MainActivity.dart';
import '../main.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);







  final List<PageViewModel> pages=[
    PageViewModel(title: 'Experience Web3 like never before!',body: 'Single-player quizzes of Web3 and the Covalent ecosystem.',

    image: Padding(
      padding: const EdgeInsets.fromLTRB(10,20,10,5),
      child: Center(
        child: Image.asset('assets/screen1.gif'),
      ),
    ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,color: Color(0xffBFD1FF),
          fontWeight: FontWeight.bold, fontFamily: 'Ubuntu',
        ),
        bodyTextStyle: TextStyle(
          fontSize: 16,color: Color(0xffDEE7FF),
          fontWeight: FontWeight.bold, fontFamily: 'Ubuntu',
        ),
      )
    ),
    PageViewModel(title: 'Play multiple times to level up your ranking!',body: 'Learn the fundamentals of Web3, compete with your friends, and have fun!',
        image: Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,5),
          child: Center(
            child: Image.asset('assets/screen2.gif'),

          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 24,color: Color(0xffBFD1FF),
              fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'
            ),
          bodyTextStyle: TextStyle(
           fontSize: 16,color: Color(0xffDEE7FF),
           fontWeight: FontWeight.bold,fontFamily: 'Ubuntu',
        ),
        )
    )
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(

      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
        backgroundColor: const Color(0xff98A8D0),

      ),

      body:
      IntroductionScreen(
        pages: pages,
        globalBackgroundColor: const Color(0xff303646),
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color(0xff555B68),
          activeSize: Size.square(15),
          activeColor: Color(0xffBFD1FF),
        ),

        curve: Curves.bounceInOut,
        showDoneButton: true,
        done: const Text('Done',style: TextStyle(fontSize: 20,color: Color(0xffBFD1FF),fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),
        showSkipButton: true,
        skip: const Text('Skip',style: TextStyle(fontSize: 20,color: Color(0xffBFD1FF),fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),
        showNextButton: true,
        next: const Text('Next',style: TextStyle(fontSize: 20,color: Color(0xffBFD1FF),fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),
        onDone: () =>onDone(context),

      ),

    );
  }
  
  void onDone(context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  MainActivity()));
  }

  // void isFirstTimeChecker() async {
  //   final prefs =await SharedPreferences.getInstance();
  //   bool? isFirst=prefs.getBool("FirstTime");
  //
  //   if(isFirst==null){
  //     prefs.setBool("FirstTime",false);
  //   }else{
  //     onDone(context);
  //   }
  //
  // }

}
