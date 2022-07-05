
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AlertDialog/AvatarSelectionDialog.dart';
import 'AlertDialog/LoadingAlertDialog.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'Quiz/LeaderBoardModel.dart';
import 'Quiz/LeaderBoardModelStr.dart';
import 'Quiz/NormalQuizActivity.dart';



class MainActivity extends StatefulWidget {




  // MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Color firstColor= Color(0Xff393F4E);
  Color secondColor=Color(0XffBFD1FF);
  bool isClicked = true;



  List<LeaderBoardModelStr> list=[];



  Widget leaderBoardTemplate(list){

    return LeaderBoardCard(list.username,list.imageUrl,list.correct,list.score,list.summationScore,list.totalTime,list.wrong);
  }

   LeaderBoardCard(username, imageUrl,correct,score,summationScore,totalTime,wrong){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
          children: <Widget>[
            Container(
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0Xff3D4352),
                  border: Border.all(width: 1.5, color: Color(0xff555B68)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff98A8D0).withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Padding(
                        padding:  EdgeInsets.all(8),
                        child: Image.asset(
                          "$imageUrl",
                          height: 25,
                          width: 25,
                          filterQuality: FilterQuality.low,
                          //  fit:BoxFit.cover
                        ),

                      ),



                    Expanded(child:
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: double.minPositive,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0Xff2E323C),
                        ),

                        child : Column(
                          children: [
                            Row(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5,3,3,3),
                                  child: Text(
                                    "$username",
                                    maxLines: 1,

                                    style: TextStyle(
                                        fontSize: 11.5,
                                        color: Color(0xffBFD1FF),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(3,4,3,3),
                                  child: Text(
                                    "Correc/Wrong : $correct/$wrong",
                                    maxLines: 1,

                                    style: TextStyle(
                                        fontSize: 9.5,
                                        color: Color(0xffBFD1FF),
                                       // fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu'),
                                  ),
                                ),
                              ],
                            ),
                            Row(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5,0,3,3),
                                  child: Text(
                                    "HS : $score",
                                    maxLines: 1,

                                    style: TextStyle(
                                        fontSize: 12.5,
                                        color: Color(0xffBFD1FF),
                                      //  fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(3,0,3,3),
                                  child: Text(
                                    "Total Time : $totalTime",
                                    maxLines: 1,

                                    style: TextStyle(
                                        fontSize: 9.5,
                                        color: Color(0xffBFD1FF),
                                        // fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );

  }


  leaderBoardData() async {
    // final ref = FirebaseDatabase.instance.ref();
    // final prefs = await SharedPreferences.getInstance();
    // String? uidString=prefs.getString("UID");
    // final snapshot2 = await ref.child('NEW_APP/User/$uidString/personal/userName').get();
    // if(snapshot2.exists){
    //   await prefs.setString("Name", snapshot2.value.toString());
    // }




 //   final needsSnapshot = await FirebaseDatabase.instance.refFromURL("NEW_APP/LeaderBoard/").get();

    final needsSnapshot = await FirebaseDatabase.instance.refFromURL("https://blockchaintrivia-8fc26-default-rtdb.firebaseio.com/NEW_APP/LeaderBoard").get();
    if (needsSnapshot.exists) {



      print(needsSnapshot.toString());

      // needsSnapshot.onChildAdded
      //     .forEach((event) => {
      //   print(event.snapshot.value)
      // });




      final map = needsSnapshot.value as Map<dynamic, dynamic>;
      map.forEach((key, value) {
        print("$key : $value");
        int totalTime=value["totalTime"];
        String totalTimeStr=(totalTime/60).round().toString()+" min "+(totalTime%60).toString()+" sec";
        String image="assets/ava1.png";
        switch(value["imageUrl"]){
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava1.png?alt=media&token=39fc4486-0021-443f-974d-daa3fc17bec2":
            image="assets/ava1.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava2.png?alt=media&token=e19cd95b-6012-4fe7-94bb-003c1b9f92c0":
            image="assets/ava2.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava3.png?alt=media&token=d0a90643-c6f3-446e-a386-8de3dc052765":
            image="assets/ava3.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava4.png?alt=media&token=ff5f2d52-eb31-4d55-af59-2de2ecda6a51":
            image="assets/ava4.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava5.png?alt=media&token=6a354ce9-d45a-4bfa-8c26-6d1db00ceb84":
            image="assets/ava5.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava6.png?alt=media&token=445f480e-c646-45b1-b55c-8ff86469e97f":
            image="assets/ava6.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava7.png?alt=media&token=41f409b7-6c19-4827-9723-fbd8856215f2":
            image="assets/ava7.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava8.png?alt=media&token=4a3682cc-3242-4582-b3c3-fff6591b7af5":
            image="assets/ava8.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava9.png?alt=media&token=f9048bb1-fd25-48fe-95ed-65f70f0607b3":
            image="assets/ava9.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava10.png?alt=media&token=881f92b8-973a-462a-8a3c-8c6f70cd888b":
            image="assets/ava10.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava11.png?alt=media&token=26a5711e-2a8c-449e-bc3a-4a2d98811cc1":
            image="assets/ava10.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava12.png?alt=media&token=e09e3572-c79d-4bb3-9756-29f18967f0db":
            image="assets/ava12.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava13.png?alt=media&token=82a5dece-0e9a-4e2c-824a-1c4b441073bc":
            image="assets/ava13.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava14.png?alt=media&token=bb2e7b65-2709-432b-add4-cac32bf3cd6d":
            image="assets/ava14.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava15.png?alt=media&token=fea2cbe9-2359-4577-a113-562e54341031":
            image="assets/ava15.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava16.png?alt=media&token=f31d2368-92f4-4e82-a384-aaabf11c6dc3":
            image="assets/ava16.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava17.png?alt=media&token=4d7eacfd-d75e-432d-bf6d-bc95acdb3ebf":
            image="assets/ava17.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava18.png?alt=media&token=2e1493eb-905a-47cc-b86c-0540d5a7561c":
            image="assets/ava18.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava19.png?alt=media&token=faa84af3-2195-46b7-a44f-d6b272698443":
            image="assets/ava19.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava20.png?alt=media&token=b7aee3f8-a774-4ceb-9be9-4bd4dba39b04":
            image="assets/ava20.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava21.png?alt=media&token=d32fccfd-57c3-4f07-99c6-0da9cc921d5e":
            image="assets/ava21.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava22.png?alt=media&token=37793d6e-55bf-4be6-9c3e-b49f69cb25f8":
            image="assets/ava22.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava23.png?alt=media&token=c4fe300d-b6cb-4102-b956-082c89ed6bcb":
            image="assets/ava23.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava24.png?alt=media&token=35520f68-1000-4c84-b8ed-56b2bf64b14f":
            image="assets/ava24.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava25.png?alt=media&token=c2eec723-3f40-4dc6-a294-caa4db20cf66":
            image="assets/ava25.png";break;
          case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava26.png?alt=media&token=2cd731f2-e525-49b3-ac81-dc939cbd82fe":
            image="assets/ava26.png";break;
        }

        LeaderBoardModelStr leaderBoardModelStr=LeaderBoardModelStr(value["username"], image, value["correct"], value["score"], value["sumationScore"], totalTimeStr, value["wrong"]);

        list.add(leaderBoardModelStr);
      });

      setState(() {
        list.sort((a, b) => b.score.compareTo(a.score));
      });



      for(int i=0;i<list.length;i++){
        print(list[i].score.toString());
      }
    }




  }


  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);




    return Scaffold(

      backgroundColor: Color(0xff303646),
      appBar: AppBar(
        centerTitle: false,
          backgroundColor: Color(0xff98A8D0),
        title:
        Image.asset(
        'assets/covalent_dark_icon.png',
        height: 45,
        width: 120,

      ),




      ),



      body: Padding(
        padding:  EdgeInsets.all(17.0),
        child: Container(




        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [




                     Expanded(
                       flex: 1,

                       child: Container(
                       //    height: 200,



                       child: InkWell(


                         child :  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(


                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(7),
                               color: Color(0Xff3D4352),
                               border: Border.all(width: 1.5, color: Color(0xff555B68)),
                               boxShadow: [
                                 BoxShadow(
                                   color: Color(0xff98A8D0).withOpacity(0.15),
                                   spreadRadius: 1,
                                   blurRadius: 10,
                                   offset: Offset(1, 1), // changes position of shadow
                                 ),
                               ],
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Transform.scale(
                                   scale: 1.3,
                                   child: Padding(
                                     padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                     child: Lottie.asset(
                                       "assets/blockchain_anim.json",
                                       repeat: true,
                                       height: 150,
                                       width: 150,
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),


                                         child:Container(
                                           width: double.maxFinite,
                                          // height: double.maxFinite,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(7),
                                             color: Color(0Xff2E323C),
                                           ),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             children:  [



                                               Padding(
                                                 padding: EdgeInsets.fromLTRB(5, 5, 0, 5),


                                                 child:  AutoSizeText(
                                                   "Onboarding Quiz",
                                                   maxLines: 1,

                                                   style: TextStyle(
                                                       fontSize: 28.5,
                                                       color: Color(0xffBFD1FF),
                                                       fontWeight: FontWeight.bold,
                                                       fontFamily: 'Ubuntu'),
                                                 ),
                                               ),

                                               Padding(
                                                 padding: EdgeInsets.fromLTRB(5, 0, 5, 5),

                                                 child: AutoSizeText(
                                                   "Test how well you know Covalent’s company fundamentals.",
                                                   maxLines: 3,
                                                   minFontSize: 7,
                                                   style: TextStyle(
                                                     fontSize: 20,
                                                     color: Color(0xffDEE7FF),
                                                     fontFamily: 'Ubuntu',
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),




                                 ),

                               ],
                             ),
                           ),
                         ),
                         onTap: () {
                           Ink(height: 100, width: 100, color: Colors.blue);
                           //TODO CHANGES TO BE DONE HERE
                           //  onDone(context);
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  NormalQuizActivity(s: '1',)));
                         },
                       ),
                     ),
                     ),


                     Expanded(
                       flex: 1,
                       child: Container(
                         // height: 180,

                         child: InkWell(


                           child :  Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(


                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7),
                                 color: Color(0Xff3D4352),
                                 border: Border.all(width: 1.5, color: Color(0xff555B68)),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Color(0xff98A8D0).withOpacity(0.15),
                                     spreadRadius: 1,
                                     blurRadius: 10,
                                     offset: Offset(1, 1), // changes position of shadow
                                   ),
                                 ],
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Transform.scale(
                                     scale: 1.0,
                                     child: Padding(
                                       padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                       child: Image.asset(
                                                       "assets/logo_anim.gif",
                                                       height: 150,
                                                       width: 150,
                                                     ),
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
                                     child:

                                     Container(
                                       width: double.maxFinite,
                                       // height: double.maxFinite,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(7),
                                         color: Color(0Xff2E323C),
                                       ),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children:  [



                                           Padding(
                                             padding: EdgeInsets.fromLTRB(5, 5, 0, 5),


                                             child:  AutoSizeText(
                                               "Covalent API Quiz",
                                               maxLines: 1,

                                               style: TextStyle(
                                                   fontSize: 28.5,
                                                   color: Color(0xffBFD1FF),
                                                   fontWeight: FontWeight.bold,
                                                   fontFamily: 'Ubuntu'),
                                             ),
                                           ),

                                           Padding(
                                             padding: EdgeInsets.fromLTRB(5, 0, 5, 5),

                                             child: AutoSizeText(
                                               "Test how well you know the fundamentals of the Covalent API",
                                               maxLines: 3,
                                               minFontSize: 7,
                                               style: TextStyle(
                                                 fontSize: 20,
                                                 color: Color(0xffDEE7FF),
                                                 fontFamily: 'Ubuntu',
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),



                                   ),

                                 ],
                               ),
                             ),
                           ),
                           onTap: () {
                             Ink(height: 100, width: 100, color: Colors.blue);
                             //TODO CHANGES TO BE DONE HERE
                             //  onDone(context);
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  NormalQuizActivity(s: '2',)));
                           },
                         ),
                       ),
                     ),





                   ],
                 ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0Xff2E323C),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Leaderboard",textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xffDEE7FF),
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                ),
              ),

            // ListView.builder(
            //
            //     itemCount: list.length,
            //     itemBuilder: (BuildContext context, int position) {
            //       return LeaderBoardCard(position);
            //     }),
              Expanded(

              child:SingleChildScrollView(
                child: Column(
                  children: list.map((list){
                    return leaderBoardTemplate(list);
                  }).toList(),

                ),
              )
        ),

            ],
          ),

        ),
      ),
    );





  }

  @override
  initState() {         // this is called when the class is initialized or called for the first time
    super.initState();
    Future.delayed(Duration.zero, () {
      final FirebaseAuth auth = FirebaseAuth.instance;


   //   String avatarSelected="https://firebasestorage.googleapis.com/v0/b/paper-wind.appspot.com/o/BydefalutPic%2Fdefaultpropic.png?alt=media&token=f655727d-9740-4ac9-9ba2-f53ea02dc778";

   //   showAvatarDialog(context,avatarSelected);

      if(auth.currentUser==null){

        //TODO CURRENT USER NULL



        showAlertDialog(context,auth);
        leaderBoardData();

        print("NULL STRING BRO");
      }else{

        //TODO CURRENT USER NOT NULL
        leaderBoardData();
        print("NOT NULL STRING BRO");
      }





    });

  }


  void signup(BuildContext context, FirebaseAuth auth,LoadingAlertDialog loadingAlertDialog) async {

    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: "PASTE THE CLIENT ID HERE");
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;


      loadingAlertDialog.dismiss();

      if (result != null) {
        print("Successful");

       // SharePref sharePref=SharePref();

        final prefs = await SharedPreferences.getInstance();

      //  String? email=user!.email;
        String? uid=user!.uid;

        String? profileImage=user.photoURL;

      //  prefs.setString(email!, "EMAIL");



        String uidString=user.uid;

        await prefs.setString("UID", uidString);


        print("UID SAVED : "+uidString);

        final ref = FirebaseDatabase.instance.ref();
        final snapshot = await ref.child('NEW_APP/User/$uidString/personal/firstTime').get();
        if (snapshot.exists) {
          final snapshot1 = await ref.child('NEW_APP/User/$uidString/personal/userName').get();
          if(snapshot1.exists){
            await prefs.setString("Name", snapshot1.value.toString());
          }

          final snapshot2 = await ref.child('NEW_APP/User/$uidString/personal/imageURL').get();
          if(snapshot2.exists){


            String image="assets/ava1.png";
            switch(snapshot2.value.toString()){
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava1.png?alt=media&token=39fc4486-0021-443f-974d-daa3fc17bec2":
                image="assets/ava1.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava2.png?alt=media&token=e19cd95b-6012-4fe7-94bb-003c1b9f92c0":
                image="assets/ava2.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava3.png?alt=media&token=d0a90643-c6f3-446e-a386-8de3dc052765":
                image="assets/ava3.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava4.png?alt=media&token=ff5f2d52-eb31-4d55-af59-2de2ecda6a51":
                image="assets/ava4.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava5.png?alt=media&token=6a354ce9-d45a-4bfa-8c26-6d1db00ceb84":
                image="assets/ava5.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava6.png?alt=media&token=445f480e-c646-45b1-b55c-8ff86469e97f":
                image="assets/ava6.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava7.png?alt=media&token=41f409b7-6c19-4827-9723-fbd8856215f2":
                image="assets/ava7.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava8.png?alt=media&token=4a3682cc-3242-4582-b3c3-fff6591b7af5":
                image="assets/ava8.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava9.png?alt=media&token=f9048bb1-fd25-48fe-95ed-65f70f0607b3":
                image="assets/ava9.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava10.png?alt=media&token=881f92b8-973a-462a-8a3c-8c6f70cd888b":
                image="assets/ava10.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava11.png?alt=media&token=26a5711e-2a8c-449e-bc3a-4a2d98811cc1":
                image="assets/ava10.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava12.png?alt=media&token=e09e3572-c79d-4bb3-9756-29f18967f0db":
                image="assets/ava12.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava13.png?alt=media&token=82a5dece-0e9a-4e2c-824a-1c4b441073bc":
                image="assets/ava13.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava14.png?alt=media&token=bb2e7b65-2709-432b-add4-cac32bf3cd6d":
                image="assets/ava14.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava15.png?alt=media&token=fea2cbe9-2359-4577-a113-562e54341031":
                image="assets/ava15.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava16.png?alt=media&token=f31d2368-92f4-4e82-a384-aaabf11c6dc3":
                image="assets/ava16.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava17.png?alt=media&token=4d7eacfd-d75e-432d-bf6d-bc95acdb3ebf":
                image="assets/ava17.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava18.png?alt=media&token=2e1493eb-905a-47cc-b86c-0540d5a7561c":
                image="assets/ava18.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava19.png?alt=media&token=faa84af3-2195-46b7-a44f-d6b272698443":
                image="assets/ava19.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava20.png?alt=media&token=b7aee3f8-a774-4ceb-9be9-4bd4dba39b04":
                image="assets/ava20.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava21.png?alt=media&token=d32fccfd-57c3-4f07-99c6-0da9cc921d5e":
                image="assets/ava21.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava22.png?alt=media&token=37793d6e-55bf-4be6-9c3e-b49f69cb25f8":
                image="assets/ava22.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava23.png?alt=media&token=c4fe300d-b6cb-4102-b956-082c89ed6bcb":
                image="assets/ava23.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava24.png?alt=media&token=35520f68-1000-4c84-b8ed-56b2bf64b14f":
                image="assets/ava24.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava25.png?alt=media&token=c2eec723-3f40-4dc6-a294-caa4db20cf66":
                image="assets/ava25.png";break;
              case "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava26.png?alt=media&token=2cd731f2-e525-49b3-ac81-dc939cbd82fe":
                image="assets/ava26.png";break;
            }

            await prefs.setString("Image", image);
            await prefs.setString("URLImage", snapshot2.value.toString());
          }


          print(snapshot.value);
          Navigator.pop(context, true);
        } else {

          DatabaseReference ref = FirebaseDatabase.instance.ref("NEW_APP/User/$uidString/personal");

          await ref.set({
            "firstTime": 1,
            "imageURL": profileImage,
            "userName": user.displayName
          });

          Navigator.pop(context, true);



          showAvatarDialog(context,profileImage);


          print('No data available.');
        }




      } else {
        print("Failed");
        Navigator.pop(context, true);
      }
      // for go to the HomePage screen
    }
  }





  showAlertDialog(BuildContext context, FirebaseAuth auth) {
    // set up the buttons
    Widget doneButton = Container(
      margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: Center(
        child: ElevatedButton(
           // color:  Color(0xFF4285F4),
            onPressed: () {
              AlertDialog alertDialog=AlertDialog();
              LoadingAlertDialog loadingAlertDialog=LoadingAlertDialog(context,alertDialog);
              loadingAlertDialog.start();
              loadingAlertDialog.show();
              signup(context,auth,loadingAlertDialog);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.5),
                  child: Image.asset(
                    'assets/google_anim.gif',
                    height: 35.0,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )),
              ],
            )),
      ),
    );





    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      // title: Text("Please SignUp!"),
      backgroundColor: Color(0xff393F4E),
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content: Lottie.asset("assets/sign_up.json",
          repeat: true, width: 120, height: 120),

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





  showAvatarDialog(BuildContext context, String? profileImage) {


    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AvatarSelectionDialog(context,profileImage);
      },
    );
  }

  void onDone(context) {
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  NormalQuizActivity(s: "1",)));
  }
}
