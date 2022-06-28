import 'dart:convert';

import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../AlertDialog/LoadingAlertDialog.dart';
import '../AlertDialog/ScoreCardDialog.dart';
import 'LeaderBoardModel.dart';
import 'QuestionModel.dart';

class NormalQuizActivity extends StatefulWidget {
  final String s;
  NormalQuizActivity({Key? key, required this.s}) : super(key: key);



  @override
  State<NormalQuizActivity> createState() => _NormalQuizActivityState(s);
}

class _NormalQuizActivityState extends State<NormalQuizActivity> {
  List<QuestionModel> questionModel = <QuestionModel>[];
  String button1Text = "",
      button2Text = "",
      button3Text = "",
      button4Text = "",
      screenText = "",
      questionCounterText = "";
  int tracker = 0, counter = 1, correctAns = 0, lifeLineCounter = 0;
  Color button1Color = Color(0Xff393F4E),
      button2Color = Color(0Xff393F4E),
      button3Color = Color(0Xff393F4E),
      button4Color = Color(0Xff393F4E);
  Color button1BorderColor = Color(0xff555B68),
      button2BorderColor = Color(0xff555B68),
      button3BorderColor = Color(0xff555B68),
      button4BorderColor = Color(0xff555B68);

  Color button1TextColor = Color(0xffBFD1FF),
      button2TextColor = Color(0xffBFD1FF),
      button3TextColor = Color(0xffBFD1FF),
      button4TextColor = Color(0xffBFD1FF);

  String? anim1 = "assets/warning_anim.json",
      anim2 = "assets/warning_anim.json",
      anim3 = "assets/warning_anim.json",
      anim4 = "assets/warning_anim.json",
      anim5 = "assets/warning_anim.json",
      anim6 = "assets/warning_anim.json",
      anim7 = "assets/warning_anim.json",
      anim8 = "assets/warning_anim.json",
      anim9 = "assets/warning_anim.json",
      anim10 = "assets/warning_anim.json";

  bool anim1Visibility = false,
      anim2Visibility = false,
      anim3Visibility = false,
      anim4Visibility = false,
      anim5Visibility = false,
      anim6Visibility = false,
      anim7Visibility = false,
      anim8Visibility = false,
      anim9Visibility = false,
      anim10Visibility = false;

  String myImage = "",myImageUrl="";
  bool visiblityImage = false;
  String expertAdvideIntro = "", expertImage = "", expertAdviceAnswer = "";
  int yo1 = 0, yo2 = 0, yo3 = 0, yo4 = 0;

  CountDownController countDownController = CountDownController();

  bool audienceUsed = false,
      swapUsed = false,
      expertUsed = false,
      fiftyfiftyUsed = false;

  bool nextButtonEnable = false;
  bool option1Enable = false,
      option2Enable = false,
      option3Enable = false,
      option4Enable = false;

  bool audienceEnable = false,
      swapEnable = false,
      expertEnable = false,
      fiftyfiftyEnable = false;

  double opacityNextButton = 0.6;

  Color expertBack = Color(0xff98A8D0),
      swapBack = Color(0xff98A8D0),
      audienceBack = Color(0xff98A8D0),
      fiftyfiftyBack = Color(0xff98A8D0);
  String? myName1, uid;

  AlertDialog alertDialogScoreCard = AlertDialog();
  List<SalesData> list = [];

  String s;
  _NormalQuizActivityState(this.s);



  @override
  initState() {
    // this is called when the class is initialized or called for the first time
    super.initState();
    Future.delayed(Duration.zero, () async {
      AlertDialog alertDialog = AlertDialog();
      LoadingAlertDialog loadingAlertDialog =
          LoadingAlertDialog(context, alertDialog);
      loadingAlertDialog.start();
      loadingAlertDialog.show();

      for (int i = 1; i <= 11; i++) {
        final ref = FirebaseDatabase.instance.ref();

        //     final map = needsSnapshot.value as Map<dynamic, dynamic>;

        final data = await ref.child('SETS/$s/questions/$i').get();

        print(data.value.toString());
        final map = data.value as Map<dynamic, dynamic>;
        var questionModel1 = QuestionModel(
            map["correctAnswer"],
            map["questionTextView"],
            map["option1"],
            map["option2"],
            map["option3"],
            map["option4"],
            i);

        // var questionModel1 = QuestionModel(
        //     snapshotCorrectAns.value.toString(),
        //     snapshotQuestion.value.toString(),
        //     snapshotOption1.value.toString(),
        //     snapshotOption2.value.toString(),
        //     snapshotOption3.value.toString(),
        //     snapshotOption4.value.toString(),
        //     i);
        questionModel.add(questionModel1);

        if (i == 11) {
          setState(() {
            option1Enable = true;
            option2Enable = true;
            option3Enable = true;
            option4Enable = true;
            audienceEnable = true;
            swapEnable = true;
            expertEnable = true;
            fiftyfiftyEnable = true;
            button1Text = questionModel[tracker].option1;
            button2Text = questionModel[tracker].option2;
            button3Text = questionModel[tracker].option3;
            button4Text = questionModel[tracker].option4;
            screenText = questionModel[tracker].questionTextView;
            loadingAlertDialog.dismiss();
            tracker++;
            questionCounterText = "$counter/10";
            counter++;

            countDownController.start();
          });
        }

        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return String

        myImage = prefs.getString('Image')!;
        myImageUrl = prefs.getString('URLImage')!;


        visiblityImage = true;

        //print("my image :"+myImage);

      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      myName1 = prefs.getString('Name');
      print(questionModel.length);

      uid = prefs.getString('UID');

      final ref1 = FirebaseDatabase.instance.ref();
      final snapshot =
          await ref1.child("NEW_APP/User/$uid/MY_DATA/LineGraph").get();

      if(snapshot.exists){
        final map = snapshot.value as Map<dynamic, dynamic>;
        int i = 1;
        map.forEach((key, value) {
          list.add(SalesData(i.toString(), value));
          print(i.toString() + " VALUEEEE " + value.toString());
          i++;
        });
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Color(0xff303646),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,10,20,20),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 5),
                        child: CircularCountDownTimer(
                          duration: 180,
                          initialDuration: 0,
                          controller: countDownController,
                          width: 50,
                          height: 50,
                          ringColor: Color(0xff555B68),
                          ringGradient: null,
                          fillColor: Color(0xff98A8D0),
                          fillGradient: null,
                          backgroundColor: Color(0xff2E323C),
                          backgroundGradient: null,
                          strokeWidth: 5.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff98A8D0),
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            debugPrint('Countdown Started');
                          },
                          onComplete: () {
                            scoreBoard();
                            debugPrint('Countdown Ended');
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0Xff393F4E),
                            border:
                                Border.all(width: 1, color: Color(0xff555B68)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffBFD1FF).withOpacity(0.15),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text(
                              "$questionCounterText",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xffBFD1FF),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //UPPER ANSWER STATUS
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 10, 10, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0Xff393F4E),
                        border: Border.all(width: 1, color: Color(0xff555B68)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffBFD1FF).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 440,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Visibility(
                                visible: visiblityImage,
                                child: Image.asset(
                                  "$myImage",
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0Xff2E323C),
                                    ),
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Visibility(
                                            visible: anim1Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim1",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim2Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim2",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim3Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim3",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim4Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim4",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim5Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim5",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim6Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim6",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim7Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim7",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim8Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim8",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim9Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim9",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: anim10Visibility,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  1.5, 0, 1.5, 0),
                                              child: Container(
                                                child: Lottie.asset(
                                                  "$anim10",
                                                  repeat: false,
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //SCREEN
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 5, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0Xff393F4E),
                        border: Border.all(width: 1, color: Color(0xff555B68)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffBFD1FF).withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 200,
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "$screenText",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffBFD1FF),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu'),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //LIFELINES
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(2, 0, 20, 5),
                          child: InkWell(
                            onTap: () async {
                              if(expertEnable){

                              if (expertUsed) {
                                showLifeLineUsed(context, "Expert Advice");
                              } else {
                                expertUsed = true;

                                lifeLineCounter++;

                                audienceBack = Color(0x5c70737a);

                                Random rand = new Random();
                                int num = rand.nextInt(11) + 1;

                                switch (num) {
                                  case 1:
                                    expertImage = "assets/expert1female.png";
                                    expertAdvideIntro =
                                        " Dorjana Sirola: Highest woman scorer in World Quizzing Championship, Croatian linguist and anglicist is your Expert for the day";
                                    break; //white complexion,short hair
                                  case 2:
                                    expertImage = "assets/expert2male.png";
                                    expertAdvideIntro =
                                        "Dr.Neil deGrasse Tyson: Astrophysicist, Planetory scientist, Author and Science communicator is your Expert for the day";
                                    break; //Dark complexion
                                  case 3:
                                    expertImage = "assets/expert3male.png";
                                    expertAdvideIntro =
                                        "Kevin Ashman: Six times World Quizzing Championship winner and Five times British Quizzing Champion is your Expert for the day";
                                    break; //white complexion
                                  case 4:
                                    expertImage = "assets/expert4male.png";
                                    expertAdvideIntro =
                                        "Derek O'Brian: Quiz Master, Indian politician and television personality is your Expert for the day";
                                    break; //white complexion, spects
                                  case 5:
                                    expertImage = "assets/expert5male.png";
                                    expertAdvideIntro =
                                        "Pat Gibson: Multiple World champion in quizzing, Software developer and professional Irish quizzer is your Expert for the day.";
                                    break; // white complexion, spectacles
                                  case 6:
                                    expertImage = "assets/expert6female.png";
                                    expertAdvideIntro =
                                        "Elsie Kaufmann: Quiz mistress, Ghanaian academic and Biomedical engineer is your Expert for the day.";
                                    break; //Dark complexion
                                  case 7:
                                    expertImage = "assets/expert7male.png";
                                    expertAdvideIntro =
                                        "Olav Bjortomt: Four time World champion and English international quiz star player is your Expert for the day";
                                    break; //White complexion
                                  case 8:
                                    expertImage = "assets/expert8female.png";
                                    expertAdvideIntro =
                                        "Anne Hegerty: English quizzer and famous UK television personality is your Expert for the day";
                                    break; //White complexion,short hair,fat face
                                  case 9:
                                    expertImage = "assets/expert9female.png";
                                    expertAdvideIntro =
                                        "Seema Chari: Quiz mistress, author, anchor and knowledge media professional is your Expert for the day";
                                    break; //curly hair
                                  case 10:
                                    expertImage = "assets/expert10male.png";
                                    expertAdvideIntro =
                                        "Siddhartha Basu: Father of Indian television quizzing, producer-director and quiz show host is your Expert for the day";
                                    break; //almost no hair,fair complexion
                                  case 11:
                                    expertImage = "assets/expert11male.png";
                                    expertAdvideIntro =
                                        "Tom Trogh: Belgian quiz player and European quizzing champion is your Expert for the day";
                                    break; //White complexion
                                  case 12:
                                    expertImage = "assets/expert12male.png";
                                    expertAdvideIntro =
                                        "Ravi Avva: 2020 World Quizzing champion, Singaporean hailing from India and an Engineer is your Expert for the day";
                                    break; //Fair complexion,spectacles

                                }
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                //Return String
                                final String? myName = prefs.getString('Name');

                                if (button1Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  expertAdviceAnswer =
                                      "$myName I think you should go for : '$button1Text'";
                                } else if (button2Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  expertAdviceAnswer =
                                      "$myName I think you should go for : '$button2Text'";
                                } else if (button3Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  expertAdviceAnswer =
                                      "$myName I think you should go for : '$button3Text'";
                                } else {
                                  expertAdviceAnswer =
                                      "$myName I think you should go for : '$button4Text'";
                                }

                                showLifeLineExpertAdvice(context);
                              }
                              }
                            }, // Handle your onTap
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: audienceBack,
                                border: Border.all(
                                    width: 1, color: Color(0xff555B68)),
                                boxShadow: [
                                  // BoxShadow(
                                  //   color:
                                  //       Color(0xffBFD1FF).withOpacity(0.15),
                                  //   spreadRadius: 1,
                                  //   blurRadius: 5,
                                  //   offset: Offset(
                                  //       1, 1), // changes position of shadow
                                  // ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/lifeline_expert_advice.png",
                                  height: 55,
                                  width: 55,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 20, 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {

                                if(swapEnable){
                                  if (swapUsed) {
                                    showLifeLineUsed(context, "Swap");
                                  } else {
                                    lifeLineCounter++;
                                    swapBack = Color(0x5c70737a);
                                    swapUsed = true;
                                    button1Text = questionModel[tracker].option1;
                                    button2Text = questionModel[tracker].option2;
                                    button3Text = questionModel[tracker].option3;
                                    button4Text = questionModel[tracker].option4;
                                    screenText =
                                        questionModel[tracker].questionTextView;
                                    tracker++;
                                  }
                                }



                              });
                            }, // Handle your onTap
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: swapBack,
                                border: Border.all(
                                    width: 1, color: Color(0xff555B68)),
                                boxShadow: [
                                  // BoxShadow(
                                  //   color:
                                  //       Color(0xffBFD1FF).withOpacity(0.15),
                                  //   spreadRadius: 1,
                                  //   blurRadius: 5,
                                  //   offset: Offset(
                                  //       1, 1), // changes position of shadow
                                  // ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/lifeline_flip.png",
                                  height: 55,
                                  width: 55,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 20, 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {

                                if(audienceEnable){

                                  if (audienceUsed) {
                                    showLifeLineUsed(context, "Audience Poll");
                                  } else {
                                    lifeLineCounter++;
                                    expertBack = Color(0x5c70737a);
                                    audienceUsed = true;
                                    try {
                                      audienceManu();
                                    } catch (error) {
                                      try {} catch (error) {
                                        try {} catch (error) {}
                                      }
                                    }

                                    showLifeLineAudience(context);
                                  }
                                }


                              });
                            }, // Handle your onTap
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: expertBack,
                                border: Border.all(
                                    width: 1, color: Color(0xff555B68)),
                                boxShadow: [
                               //    BoxShadow(
                               // //     color: Color(0xffBFD1FF).withOpacity(0.15),
                               //      spreadRadius: 1,
                               //      blurRadius: 5,
                               //      offset: Offset(
                               //          1, 1), // changes position of shadow
                               //    ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/lifeline_audience.png",
                                  height: 55,
                                  width: 55,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 20, 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(fiftyfiftyEnable){
                                  if (fiftyfiftyUsed) {
                                    showLifeLineUsed(context, "Fifty-Fifty");
                                  } else {
                                    lifeLineCounter++;
                                    fiftyfiftyBack = Color(0x5c70737a);
                                    fiftyfiftyUsed = true;

                                    int manupulator = 1, selectNum = 0;

                                    if (button1Text ==
                                        questionModel[tracker - 1]
                                            .correctAnswer) {
                                      manupulator = 1;
                                    } else if (button2Text ==
                                        questionModel[tracker - 1]
                                            .correctAnswer) {
                                      manupulator = 2;
                                    } else if (button3Text ==
                                        questionModel[tracker - 1]
                                            .correctAnswer) {
                                      manupulator = 3;
                                    } else {
                                      manupulator = 4;
                                    }

                                    Random rand3 = new Random();
                                    int runStopper = 0;
                                    while (runStopper == 0) {
                                      selectNum = rand3.nextInt(4) + 1;

                                      if (manupulator != selectNum) {
                                        runStopper = 1;
                                      }
                                    }

                                    switch (selectNum) {
                                      case 1:
                                        switch (manupulator) {
                                          case 2:
                                            button3Text = "";
                                            button4Text = "";
                                            break;
                                          case 3:
                                            button2Text = "";
                                            button4Text = "";
                                            break;
                                          case 4:
                                            button2Text = "";
                                            button3Text = "";
                                            break;
                                        }
                                        ;
                                        break;
                                      case 2:
                                        switch (manupulator) {
                                          case 1:
                                            button3Text = "";
                                            button4Text = "";
                                            break;
                                          case 3:
                                            button1Text = "";
                                            button4Text = "";
                                            break;
                                          case 4:
                                            button1Text = "";
                                            button3Text = "";
                                            break;
                                        }
                                        ;
                                        break;
                                      case 3:
                                        switch (manupulator) {
                                          case 1:
                                            button2Text = "";
                                            button4Text = "";
                                            break;
                                          case 2:
                                            button1Text = "";
                                            button4Text = "";
                                            break;
                                          case 4:
                                            button1Text = "";
                                            button2Text = "";
                                            break;
                                        }
                                        ;
                                        break;
                                      case 4:
                                        switch (manupulator) {
                                          case 1:
                                            button2Text = "";
                                            button3Text = "";
                                            break;
                                          case 2:
                                            button1Text = "";
                                            button3Text = "";
                                            break;
                                          case 3:
                                            button1Text = "";
                                            button2Text = "";
                                            break;
                                        }
                                        ;
                                        break;
                                    }
                                  }
                                }



                              });
                            }, // Handle your onTap
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: fiftyfiftyBack,
                                border: Border.all(
                                    width: 1, color: Color(0xff555B68)),
                                boxShadow: [
                                  // BoxShadow(
                                  // //  color: Color(0xffBFD1FF).withOpacity(0.15),
                                  //   spreadRadius: 1,
                                  //   blurRadius: 5,
                                  //   offset: Offset(
                                  //       1, 1), // changes position of shadow
                                  // ),
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "50:50",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu'),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //BUTTONS
                  Column(
                      mainAxisSize:MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {



                              if (option1Enable) {
                                option1Enable = false;
                                option2Enable = false;
                                option3Enable = false;
                                option4Enable = false;

                                audienceEnable = false;
                                swapEnable = false;
                                expertEnable = false;
                                fiftyfiftyEnable = false;

                                if (button1Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  button1Color = Color(0Xff8CF083);
                                  button1BorderColor = Color(0Xff9DFF93);
                                  button1TextColor = Color(0Xff000000);
                                  animationSetter(true);
                                  correctAns++;
                                } else {
                                  animationSetter(false);
                                  button1Color = Color(0XffFF8D8D);
                                  button1BorderColor = Color(0XffFF5E5E);
                                  button1TextColor = Color(0Xff000000);
                                  if (button2Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button2Color = Color(0Xff8CF083);
                                    button2BorderColor = Color(0Xff9DFF93);
                                    button2TextColor = Color(0Xff000000);
                                  } else if (button3Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button3Color = Color(0Xff8CF083);
                                    button3BorderColor = Color(0Xff9DFF93);
                                    button3TextColor = Color(0Xff000000);
                                  } else {
                                    button4Color = Color(0Xff8CF083);
                                    button4BorderColor = Color(0Xff9DFF93);
                                    button4TextColor = Color(0Xff000000);
                                  }
                                }
                              }
                            });
                          }, // Handle your onTap
                          child: Ink(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: button1Color,
                                  border: Border.all(
                                      width: 1, color: button1BorderColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffBFD1FF).withOpacity(0.10),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 60,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Center(
                                    child: Text(
                                      "$button1Text",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: button1TextColor,
                                          //   fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 7, 20, 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (option2Enable) {
                                option1Enable = false;
                                option2Enable = false;
                                option3Enable = false;
                                option4Enable = false;

                                audienceEnable = false;
                                swapEnable = false;
                                expertEnable = false;
                                fiftyfiftyEnable = false;

                                if (button2Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  button2Color = Color(0Xff8CF083);
                                  button2BorderColor = Color(0Xff9DFF93);
                                  button2TextColor = Color(0Xff000000);
                                  animationSetter(true);
                                  correctAns++;
                                } else {
                                  animationSetter(false);
                                  button2Color = Color(0XffFF8D8D);
                                  button2BorderColor = Color(0XffFF5E5E);
                                  button2TextColor = Color(0Xff000000);
                                  if (button1Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button1Color = Color(0Xff8CF083);
                                    button1BorderColor = Color(0Xff9DFF93);
                                    button1TextColor = Color(0Xff000000);
                                  } else if (button3Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button3Color = Color(0Xff8CF083);
                                    button3BorderColor = Color(0Xff9DFF93);
                                    button3TextColor = Color(0Xff000000);
                                  } else {
                                    button4Color = Color(0Xff8CF083);
                                    button4BorderColor = Color(0Xff9DFF93);
                                    button4TextColor = Color(0Xff000000);
                                  }
                                }
                              }
                            });
                          }, // Handle your onTap
                          child: Ink(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: button2Color,
                                  border: Border.all(
                                      width: 1, color: button2BorderColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffBFD1FF).withOpacity(0.10),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 60,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Center(
                                    child: Text(
                                      "$button2Text",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: button2TextColor,
                                          //  fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 7, 20, 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {

                              if(option3Enable) {
                                option1Enable = false;
                                option2Enable = false;
                                option3Enable = false;
                                option4Enable = false;

                                audienceEnable = false;
                                swapEnable = false;
                                expertEnable = false;
                                fiftyfiftyEnable = false;

                                if (button3Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  button3Color = Color(0Xff8CF083);
                                  button3BorderColor = Color(0Xff9DFF93);
                                  button3TextColor = Color(0Xff000000);
                                  animationSetter(true);
                                  correctAns++;
                                } else {
                                  animationSetter(false);
                                  button3Color = Color(0XffFF8D8D);
                                  button3BorderColor = Color(0XffFF5E5E);
                                  button3TextColor = Color(0Xff000000);
                                  if (button1Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button1Color = Color(0Xff8CF083);
                                    button1BorderColor = Color(0Xff9DFF93);
                                    button1TextColor = Color(0Xff000000);
                                  } else if (button2Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button2Color = Color(0Xff8CF083);
                                    button2BorderColor = Color(0Xff9DFF93);
                                    button2TextColor = Color(0Xff000000);
                                  } else {
                                    button4Color = Color(0Xff8CF083);
                                    button4BorderColor = Color(0Xff9DFF93);
                                    button4TextColor = Color(0Xff000000);
                                  }
                                }
                              }
                            });
                          }, // Handle your onTap
                          child: Ink(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: button3Color,
                                  border: Border.all(
                                      width: 1, color: button3BorderColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xffBFD1FF).withOpacity(0.10),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 60,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Center(
                                    child: Text(
                                      "$button3Text",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: button3TextColor,
                                          //   fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 7, 20, 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if(option4Enable) {
                                option1Enable = false;
                                option2Enable = false;
                                option3Enable = false;
                                option4Enable = false;


                                audienceEnable = false;
                                swapEnable = false;
                                expertEnable = false;
                                fiftyfiftyEnable = false;

                                if (button4Text ==
                                    questionModel[tracker - 1].correctAnswer) {
                                  button4Color = Color(0Xff8CF083);
                                  button4BorderColor = Color(0Xff9DFF93);
                                  button4TextColor = Color(0Xff000000);
                                  animationSetter(true);
                                  correctAns++;
                                } else {
                                  animationSetter(false);
                                  button4Color = Color(0XffFF8D8D);
                                  button4BorderColor = Color(0XffFF5E5E);
                                  button4TextColor = Color(0Xff000000);
                                  if (button1Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button1Color = Color(0Xff8CF083);
                                    button1BorderColor = Color(0Xff9DFF93);
                                    button1TextColor = Color(0Xff000000);
                                  } else if (button2Text ==
                                      questionModel[tracker - 1]
                                          .correctAnswer) {
                                    button2Color = Color(0Xff8CF083);
                                    button2BorderColor = Color(0Xff9DFF93);
                                    button2TextColor = Color(0Xff000000);
                                  } else {
                                    button3Color = Color(0Xff8CF083);
                                    button3BorderColor = Color(0Xff9DFF93);
                                    button3TextColor = Color(0Xff000000);
                                  }
                                }
                              }
                            });
                          }, // Handle your onTap
                          child: Ink(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: button4Color,
                                  border: Border.all(
                                      width: 1, color: button4BorderColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xffBFD1FF).withOpacity(0.10),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 60,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Center(
                                    child: Text(
                                      "$button4Text",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: button4TextColor,
                                          //     fontWeight: FontWeight.bold,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          opacityNextButton = 0.6;

                          if (nextButtonEnable) {
                            if (counter < 11) {

                              option1Enable=true;option2Enable=true;option3Enable=true;option4Enable=true;

                              audienceEnable = true;
                              swapEnable = true;
                              expertEnable = true;
                              fiftyfiftyEnable = true;

                              nextButtonEnable = false;
                            button1Text = questionModel[tracker].option1;
                            button2Text = questionModel[tracker].option2;
                            button3Text = questionModel[tracker].option3;
                            button4Text = questionModel[tracker].option4;
                            screenText =
                                questionModel[tracker].questionTextView;
                            tracker++;

                            print(counter.toString());


                              questionCounterText = "$counter/10";
                              counter++;
                            } else {
                              scoreBoard();
                            }

                            button1Color = Color(0Xff393F4E);
                            button2Color = Color(0Xff393F4E);
                            button3Color = Color(0Xff393F4E);
                            button4Color = Color(0Xff393F4E);
                            button1BorderColor = Color(0xff555B68);
                            button2BorderColor = Color(0xff555B68);
                            button3BorderColor = Color(0xff555B68);
                            button4BorderColor = Color(0xff555B68);
                            button1TextColor = Color(0xffBFD1FF);
                            button2TextColor = Color(0xffBFD1FF);
                            button3TextColor = Color(0xffBFD1FF);
                            button4TextColor = Color(0xffBFD1FF);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please select an option"),
                            ));
                          }
                        });
                      },
                      child: Text("Next",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0Xff2E323C),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu')),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff98A8D0).withOpacity(opacityNextButton)),
                        fixedSize: MaterialStateProperty.all(Size(120, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  scoreBoard(){
    String timerStr = countDownController.getTime();
    print("Time left is $timerStr");
    int timeLeft = int.parse(timerStr);

    int timeTaken = 180 - timeLeft;

    String timeMinStr = "", timeSecStr = "";

    //TODO TIMER ALGO
    if (timeTaken < 60) {
      timeMinStr = "00";
      if (timeTaken % 60 < 10) {
        timeSecStr = "0${timeTaken % 60}";
      } else {
        timeSecStr = (timeTaken % 60).toString();
      }

      print("total timeSecStr : " + timeSecStr);
    } else {
      timeMinStr = "0${(timeTaken / 60).round()}";
      if (timeTaken % 60 < 10) {
        timeSecStr = "0${timeTaken % 60}";
      } else {
        timeSecStr = (timeTaken % 60).toString();
      }
      print("total timeSecStr : " + timeSecStr);
      print("total timeMinStr : " + timeMinStr);
    }

    String totalScore = ((timeLeft / 6) +
        (correctAns * 10) +
        (4 - lifeLineCounter) * 5)
        .round()
        .toString();

    print("total score : " + totalScore);

    dataUploader(totalScore, timeTaken, correctAns);

    ScoreCardDialog scoreCardDialog = ScoreCardDialog(
        context,
        alertDialogScoreCard,
        myImage,
        correctAns.toString(),
        timeMinStr,
        timeSecStr,
        lifeLineCounter,
        audienceBack,
        swapBack,
        audienceBack,
        fiftyfiftyBack,
        totalScore,
        anim1!,
        anim2!,
        anim3!,
        anim4!,
        anim5!,
        anim6!,
        anim7!,
        anim8!,
        anim9!,
        anim10!,
        myName1!,
        list,s);
    scoreCardDialog.start();
    scoreCardDialog.show();
  }

  dataUploader(String totalScore, int timeTaken, int correctAns) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("NEW_APP/LeaderBoard/$uid").get();

    if (snapshot.exists) {
      final needsSnapshot =
          await FirebaseDatabase.instance.ref("NEW_APP/LeaderBoard/$uid").get();

      final map = needsSnapshot.value as Map<dynamic, dynamic>;

      print(map.toString());

      LeaderBoardModel leaderBoardModel = LeaderBoardModel(
          map["username"],
          map["imageUrl"],
          map["correct"],
          map["score"],
          map["sumationScore"],
          map["totalTime"],
          map["wrong"]);

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("NEW_APP/LeaderBoard/$uid");
      DatabaseReference refLineGraph =
          FirebaseDatabase.instance.ref("NEW_APP/User/$uid/MY_DATA/LineGraph");
      await refLineGraph.push().set(int.parse(totalScore).round());

      if (int.parse(totalScore).round() > leaderBoardModel.score) {
        await ref.set({
          "correct": correctAns + leaderBoardModel.correct,
          "imageUrl": myImageUrl,
          "username": myName1,
          "score": int.parse(totalScore).round(),
          "sumationScore":
              int.parse(totalScore).round() + leaderBoardModel.score,
          "totalTime": timeTaken + leaderBoardModel.totalTime,
          "wrong": 10 - correctAns + leaderBoardModel.wrong
        });
      } else {
        await ref.set({
          "correct": correctAns + leaderBoardModel.correct,
          "imageUrl": myImageUrl,
          "username": myName1,
          "score": leaderBoardModel.score,
          "sumationScore":
              int.parse(totalScore).round() + leaderBoardModel.score,
          "totalTime": timeTaken + leaderBoardModel.totalTime,
          "wrong": 10 - correctAns + leaderBoardModel.wrong
        });
      }
    } else {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("NEW_APP/LeaderBoard/$uid");

      await ref.set({
        "correct": correctAns,
        "imageUrl": myImageUrl,
        "username": myName1,
        "score": int.parse(totalScore).round(),
        "sumationScore": int.parse(totalScore).round(),
        "totalTime": timeTaken,
        "wrong": 10 - correctAns
      });
    }
  }

  animationSetter(bool corrOrWron) {
    nextButtonEnable = true;
    opacityNextButton = 1;

    switch (counter - 1) {
      case 1:
        anim1Visibility = true;
        if (corrOrWron) {
          anim1 = "assets/tickanim.json";
        } else {
          anim1 = "assets/wronganim.json";
        }
        break;
      case 2:
        anim2Visibility = true;
        if (corrOrWron) {
          anim2 = "assets/tickanim.json";
        } else {
          anim2 = "assets/wronganim.json";
        }
        break;
      case 3:
        anim3Visibility = true;
        if (corrOrWron) {
          anim3 = "assets/tickanim.json";
        } else {
          anim3 = "assets/wronganim.json";
        }
        break;
      case 4:
        anim4Visibility = true;
        if (corrOrWron) {
          anim4 = "assets/tickanim.json";
        } else {
          anim4 = "assets/wronganim.json";
        }
        break;
      case 5:
        anim5Visibility = true;
        if (corrOrWron) {
          anim5 = "assets/tickanim.json";
        } else {
          anim5 = "assets/wronganim.json";
        }
        break;
      case 6:
        anim6Visibility = true;
        if (corrOrWron) {
          anim6 = "assets/tickanim.json";
        } else {
          anim6 = "assets/wronganim.json";
        }
        break;
      case 7:
        anim7Visibility = true;
        if (corrOrWron) {
          anim7 = "assets/tickanim.json";
        } else {
          anim7 = "assets/wronganim.json";
        }
        break;
      case 8:
        anim8Visibility = true;
        if (corrOrWron) {
          anim8 = "assets/tickanim.json";
        } else {
          anim8 = "assets/wronganim.json";
        }
        break;
      case 9:
        anim9Visibility = true;
        if (corrOrWron) {
          anim9 = "assets/tickanim.json";
        } else {
          anim9 = "assets/wronganim.json";
        }
        break;
      case 10:
        anim10Visibility = true;
        if (corrOrWron) {
          anim10 = "assets/tickanim.json";
        } else {
          anim10 = "assets/wronganim.json";
        }
        break;
    }
  }

  showLifeLineUsed(BuildContext context, String str) {
    // set up the buttons
    Widget doneButton = Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context, true);
            });
          },
          child: Text("Okay"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff98A8D0)),
            fixedSize: MaterialStateProperty.all(Size(130, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            )),
          ),
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.zero,
      // title: Text("Please SignUp!"),
      backgroundColor: Color(0xff393F4E),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Lottie.asset("assets/sa.json",
                repeat: true, width: 130, height: 130),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xff2E323C),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sorry! you have already used your $str lifeline once.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    color: Color(0xffDEE7FF),
                    //   fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu'),
              ),
            ),
          ),
        ),
      ]),

      actions: [
        doneButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showLifeLineExpertAdvice(BuildContext context) {
    // set up the buttons
    Widget doneButton = Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context, true);
            });
          },
          child: Text("Okay",style: TextStyle(
              fontSize: 15,
              color: Color(0Xff2E323C),
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu')),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff98A8D0)),
            fixedSize: MaterialStateProperty.all(Size(120, 45)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            )),
          ),
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.zero,
      // title: Text("Please SignUp!"),
      backgroundColor: Color(0xff393F4E),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(10,13,10,10),
                child: Transform.scale(
                  scale: 1.2,
                  child: Image.asset("$expertImage", width: 120, height: 120),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff2E323C),
                  ),
                  height: 130,
                  //width: double.minPositive,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "$expertAdviceAnswer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23,
                              color: Color(0xffBFD1FF),

                                  fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15,15,15,0),
          child: Text(
            "$expertAdvideIntro",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xffDEE7FF),
                //   fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu'),
          ),
        ),
      ]),

      actions: [
        doneButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showLifeLineAudience(BuildContext context) {
    // set up the buttons
    Widget doneButton = Padding(
      padding: EdgeInsets.fromLTRB(8, 15, 8, 0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context, true);
            });
          },
          child: Text("Okay",style: TextStyle(
              fontSize: 15,
              color: Color(0Xff2E323C),
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu')),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff98A8D0)),
            fixedSize: MaterialStateProperty.all(Size(120, 45)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            )),
          ),
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("Please SignUp!"),
      contentPadding: EdgeInsets.zero,

      backgroundColor: Color(0xff393F4E),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Center(

              child: Container(
                height: 400,
                width: 350,
                child: Transform.scale(
                  scale: 0.9,
                  child: SfCartesianChart(
                      palette: [Color.fromRGBO(191, 209, 255, 1)],
                      primaryXAxis: CategoryAxis(),
                      series: <ColumnSeries<SalesData, String>>[
                        ColumnSeries<SalesData, String>(
                          // Bind data source
                            dataSource: <SalesData>[
                              SalesData('A', yo1),
                              SalesData('B', yo2),
                              SalesData('C', yo3),
                              SalesData('D', yo4),
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ]),
                ),
              ),


            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff2E323C),
                  ),

                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "The audience has cast their votes. Choose your option!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffBFD1FF),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        doneButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  audienceManu() {
    Random rand2 = new Random();

    int manupulator = 0;

    if (button1Text == questionModel[tracker - 1].correctAnswer) {
      manupulator = 1;
    } else if (button2Text == questionModel[tracker - 1].correctAnswer) {
      manupulator = 2;
    } else if (button3Text == questionModel[tracker - 1].correctAnswer) {
      manupulator = 3;
    } else {
      manupulator = 4;
    }

    int setMax = 100 - rand2.nextInt(60);

    switch (manupulator) {
      case 1:
        yo1 = setMax;
        yo2 = rand2.nextInt(100 - yo1);
        yo3 = rand2.nextInt(100 - yo1 - yo2);
        yo4 = 100 - yo1 - yo2 - yo3;
        break;
      case 2:
        yo2 = setMax;
        yo1 = rand2.nextInt(100 - yo2);
        yo3 = rand2.nextInt(100 - yo2 - yo1);
        yo4 = 100 - yo2 - yo1 - yo3;
        break;
      case 3:
        yo3 = setMax;
        yo2 = rand2.nextInt(100 - yo3);
        yo1 = rand2.nextInt(100 - yo3 - yo2);
        yo4 = 100 - yo3 - yo2 - yo1;
        break;
      case 4:
        yo4 = setMax;
        yo2 = rand2.nextInt(100 - yo4);
        yo1 = rand2.nextInt(100 - yo4 - yo2);
        yo3 = 100 - yo4 - yo2 - yo1;
        break;
    }
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
