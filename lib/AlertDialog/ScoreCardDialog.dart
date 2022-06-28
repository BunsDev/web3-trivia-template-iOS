import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../MainActivity.dart';
import '../Quiz/NormalQuizActivity.dart';

class ScoreCardDialog {
  late final BuildContext context;
  late AlertDialog alert;
  late String myImage;
  String correctAns, timeMin, timeSec,totalScore;
  int lifeLineUsed;
  Color audienceBack, swapBack, expertBack, fiftyfiftyBack;
  String anim1,anim2,anim3,anim4,anim5,anim6,anim7,anim8,anim9,anim10,myName;
  List<SalesData> list=[];
  String s;

  ScoreCardDialog(
      this.context,
      this.alert,
      this.myImage,
      this.correctAns,
      this.timeMin,
      this.timeSec,
      this.lifeLineUsed,
      this.audienceBack,
      this.swapBack,
      this.expertBack,
      this.fiftyfiftyBack,
      this.totalScore,
      this.anim1,
      this.anim2,
      this.anim3,
      this.anim4,
      this.anim5,
      this.anim6,
      this.anim7,
      this.anim8,
      this.anim9,
      this.anim10,
      this.myName,
      this.list,
      this.s,
      );

  start() {
    alert = AlertDialog(
        // title: Text("Please SignUp!"),
        contentPadding: EdgeInsets.zero,
        // insetPadding: EdgeInsets.symmetric(horizontal: 120,vertical: 120),
        backgroundColor: Color(0Xff393F4E),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            side: BorderSide(
              color: Color(0xff555B68),
            )),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,8,15),
                          child: Image.asset(
                            "$myImage",
                            height: 85,
                            width: 85,
                            alignment: Alignment.topCenter,
                          ),
                        ),



                          Padding(
                            padding: const EdgeInsets.fromLTRB(3,0,3,0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0Xff2E323C),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "$myName",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffBFD1FF),
                                      //    fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu'),
                                ),
                              ),
                            ),

                        )


                      ],
                    ),
                  ),


                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0Xff2E323C),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Text(
                                "Correct/Answer : $correctAns/10",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xffBFD1FF),
                                    //    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Text(
                                "Timer Taken : $timeMin:$timeSec",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xffBFD1FF),
                                    //    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Text(
                                "Life-Line Used : $lifeLineUsed/4",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xffBFD1FF),
                                    //    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu'),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 10, 5),
                                      child: InkWell(
                                        onTap: () async {}, // Handle your onTap
                                        child: Ink(
                                          color: Color(0Xff393F4E),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: audienceBack,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff555B68)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffBFD1FF)
                                                      .withOpacity(0.15),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(1,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: Image.asset(
                                                "assets/lifeline_expert_advice.png",
                                                height: 35,
                                                width: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                      child: InkWell(
                                        onTap: () {}, // Handle your onTap
                                        child: Ink(
                                          color: Color(0Xff393F4E),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: swapBack,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff555B68)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffBFD1FF)
                                                      .withOpacity(0.15),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(1,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                "assets/lifeline_flip.png",
                                                height: 35,
                                                width: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                      child: InkWell(
                                        onTap: () {}, // Handle your onTap
                                        child: Ink(
                                          color: Color(0Xff393F4E),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: expertBack,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff555B68)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffBFD1FF)
                                                      .withOpacity(0.15),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(1,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                "assets/lifeline_audience.png",
                                                height: 35,
                                                width: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                      child: InkWell(
                                        onTap: () {}, // Handle your onTap
                                        child: Ink(
                                          color: Color(0Xff393F4E),
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: fiftyfiftyBack,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff555B68)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffBFD1FF)
                                                      .withOpacity(0.15),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(1,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "50:50",
                                                    style: TextStyle(
                                                        fontSize: 14.5,
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Ubuntu'),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,0,0),
                              child: Container(
                                  child: Text(
                                    "Total Score : $totalScore",
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Color(0xffBFD1FF),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu'),
                                  )
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim1",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim2",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim3",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim4",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim5",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim6",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim7",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim8",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim9",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        2, 0, 0, 0),
                                    child: Container(
                                      child: Lottie.asset(
                                        "$anim10",
                                        repeat: false,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )



                          ],
                        ),
                      ),
                    ),
                  ),



                ],
              ),


              // SfCartesianChart(
              //     palette: [Color.fromRGBO(191, 209, 255, 1)],
              //      primaryXAxis: CategoryAxis(),
              //     series: <LineSeries<SalesData, String>>[
              //       LineSeries<SalesData, String>(
              //         // Bind data source
              //           dataSource: list,
              //           xValueMapper: (SalesData sales, _) => sales.year,
              //           yValueMapper: (SalesData sales, _) => sales.sales)
              //     ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 400,
                   // width: double.maxFinite,
                    child: Transform.scale(
                      scale: 0.9,
                      child: SfCartesianChart(

                          palette: [Color.fromRGBO(191, 209, 255, 1)],
                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                              // Bind data source
                                dataSource: list,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales)
                          ]),
                    ),
                  ),
                ),
              ),


              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: ElevatedButton(

                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainActivity()));
                          },
                          child: Text("Home",style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffBFD1FF),
                                  fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu')),
                          style: ButtonStyle(
                            backgroundColor:

                            MaterialStateProperty.all(Color(0Xff2E323C)),
                            fixedSize: MaterialStateProperty.all(Size(120, 55)),
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
                    ),


                    Transform.scale(
                      scale: 0.8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: ElevatedButton(

                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NormalQuizActivity(s: '$s',)));
                          },
                          child: Text("Rematch",style: TextStyle(
                              fontSize: 18,
                              color: Color(0Xff2E323C),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu')),
                          style: ButtonStyle(
                            backgroundColor:

                            MaterialStateProperty.all(Color(0xff98A8D0)),
                            fixedSize: MaterialStateProperty.all(Size(120, 55)),
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
                    ),
                  ],
                ),
              ),



            ])



    );
  }

  void show() {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void dismiss() {
    Navigator.pop(context, true);
  }
}
