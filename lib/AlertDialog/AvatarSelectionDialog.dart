

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'LoadingAlertDialog.dart';

class AvatarSelectionDialog extends StatefulWidget {


  const AvatarSelectionDialog(this.context, this.profileImage, {Key? key}) : super(key: key);

  final BuildContext context;
  final String? profileImage;


  @override
  State<AvatarSelectionDialog> createState() => _AvatarSelectionDialogState(profileImage);
}

class _AvatarSelectionDialogState extends State<AvatarSelectionDialog> {
  Color ava1Color=Color(0xff393F4E);
  Color ava2Color=Color(0xff393F4E);
  Color ava3Color=Color(0xff393F4E);
  Color ava4Color=Color(0xff393F4E);
  Color ava5Color=Color(0xff393F4E);
  Color ava6Color=Color(0xff393F4E);
  Color ava7Color=Color(0xff393F4E);
  Color ava8Color=Color(0xff393F4E);
  Color ava9Color=Color(0xff393F4E);
  Color ava10Color=Color(0xff393F4E);
  Color ava11Color=Color(0xff393F4E);
  Color ava12Color=Color(0xff393F4E);
  Color ava13Color=Color(0xff393F4E);
  Color ava14Color=Color(0xff393F4E);
  Color ava15Color=Color(0xff393F4E);
  Color ava16Color=Color(0xff393F4E);
  Color ava17Color=Color(0xff393F4E);
  Color ava18Color=Color(0xff393F4E);
  Color ava19Color=Color(0xff393F4E);
  Color ava20Color=Color(0xff393F4E);
  Color ava21Color=Color(0xff393F4E);
  Color ava22Color=Color(0xff393F4E);
  Color ava23Color=Color(0xff393F4E);
  Color ava24Color=Color(0xff393F4E);
  Color ava25Color=Color(0xff393F4E);
  Color ava26Color=Color(0xff393F4E);

  String avatarSelected="https://firebasestorage.googleapis.com/v0/b/paper-wind.appspot.com/o/BydefalutPic%2Fdefaultpropic.png?alt=media&token=f655727d-9740-4ac9-9ba2-f53ea02dc778";
  _AvatarSelectionDialogState(String? profileImage){
    avatarSelected=profileImage!;
  }










  colorSetter(){
    ava1Color=Color(0xff393F4E);
    ava2Color=Color(0xff393F4E);
    ava3Color=Color(0xff393F4E);
    ava4Color=Color(0xff393F4E);
    ava5Color=Color(0xff393F4E);
    ava6Color=Color(0xff393F4E);
    ava7Color=Color(0xff393F4E);
    ava8Color=Color(0xff393F4E);
    ava9Color=Color(0xff393F4E);
    ava10Color=Color(0xff393F4E);
    ava11Color=Color(0xff393F4E);
    ava12Color=Color(0xff393F4E);
    ava13Color=Color(0xff393F4E);
    ava14Color=Color(0xff393F4E);
    ava15Color=Color(0xff393F4E);
    ava16Color=Color(0xff393F4E);
    ava17Color=Color(0xff393F4E);
    ava18Color=Color(0xff393F4E);
    ava19Color=Color(0xff393F4E);
    ava20Color=Color(0xff393F4E);
    ava21Color=Color(0xff393F4E);
    ava22Color=Color(0xff393F4E);
    ava23Color=Color(0xff393F4E);
    ava24Color=Color(0xff393F4E);
    ava25Color=Color(0xff393F4E);
    ava26Color=Color(0xff393F4E);
  }


 
  TextEditingController usernameControllerFirstTime = TextEditingController();



  @override
  Widget build(BuildContext context) {


    Widget continueButton =

    Transform.scale(
      scale: 0.8,
      child:Padding(
        padding:  EdgeInsets.fromLTRB(0,0,0,0),
        child: Center(
          child: ElevatedButton(onPressed: () async {

            final text = usernameControllerFirstTime.value.text;

            print("Text is : "+text.toString());




            // SharePref sharePref=SharePref();
            // String? uid=sharePref.getString("UID");

            SharedPreferences prefs = await SharedPreferences.getInstance();
            //Return String
            final String? uid =prefs.getString('UID');

            print("my uid : "+uid!);

            AlertDialog alertDialog=AlertDialog();
            LoadingAlertDialog loadingAlertDialog=LoadingAlertDialog(context, alertDialog);
            loadingAlertDialog.start();
            loadingAlertDialog.show();



            DatabaseReference ref = FirebaseDatabase.instance.ref("NEW_APP/User/$uid/personal");

            await ref.set({
              "firstTime": 1,
              "imageURL": avatarSelected,
              "userName": text.toString()
            });



            String image="assets/ava1.png";
            switch(avatarSelected.toString()){
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


           prefs.setString('Image',image);
            prefs.setString('URLImage',avatarSelected.toString());
            prefs.setString('Name',text.toString());

            print(avatarSelected.toString());

            loadingAlertDialog.dismiss();

            Navigator.pop(context, true);



          }, child: Text("Done") ,

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff98A8D0)),
              fixedSize: MaterialStateProperty.all(Size(120, 45)),

              shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  )
              ),
            ),
          ),
        ),
      ),
    );





    // set up the AlertDialog
      return AlertDialog(
      // title: Text("Please SignUp!"),
      scrollable: true,

      contentPadding: EdgeInsets.zero,
      backgroundColor: Color(0xff393F4E),
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content:




      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Expanded(
            //           child: Padding(
            //             padding:  EdgeInsets.fromLTRB(8,0,8,8),
            //             child:
            //
            //             Transform.scale(
            //               scale: 1.2,
            //               child: Lottie.asset("assets/avataranim.json", repeat: true, height: 60),
            //             ),
            //
            //           )),
            //       Padding(
            //         padding:  EdgeInsets.fromLTRB(0, 5, 5, 5),
            //         child: CircleAvatar(
            //           radius: 30.0,
            //           backgroundImage: NetworkImage(avatarSelected),
            //           backgroundColor: Colors.transparent,
            //         ),
            //       ),
            //     ]),
            //

            Padding(
              padding:  EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0Xff2E323C),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Enter username",style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffBFD1FF),
                    fontFamily: 'fonts/ubuntu.ttf',
                  ),),
                ),

              ),
            ),



            Padding(
              padding: EdgeInsets.fromLTRB(13,2,13,0),

              child: Transform.scale(

               scaleY: 0.85,
                child:  TextField(
                  controller: usernameControllerFirstTime,
                  style: TextStyle(color: Color(0xffBFD1FF),fontSize: 19),
                  decoration: InputDecoration(
                    // hintText: "Username",
                    labelText: "Username",
                    // hintStyle: TextStyle(
                    //   fontSize: 19,color: Color(0xffDEE7FF),fontFamily: 'fonts/ubuntu.ttf',
                    // ),
                    labelStyle: TextStyle(
                      fontSize: 25,color: Color(0xffDEE7FF),fontFamily: 'fonts/ubuntu.ttf',
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide(color: Color(0xffDEE7FF), width: 0.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:  BorderSide(color: Color(0xffDEE7FF), width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                  ),

                ),
              ),



            ),

            Padding(
              padding:  EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0Xff2E323C),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Select Your Avatar",style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffBFD1FF),
                    fontFamily: 'fonts/ubuntu.ttf',
                  ),),
                ),

              ),
            ),













            //PROFILE SELECTION

            //  scrollDirection: Axis.vertical,
            Column(

              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());


                            colorSetter();

                            ava1Color=Color(0xffBFD1FF);


                            avatarSelected="https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava1.png?alt=media&token=39fc4486-0021-443f-974d-daa3fc17bec2";

                          });


                        },
                        // Handle your onTap
                        child:
                        //  color: Color(0Xff393F4E),
                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ava1Color,
                            // !isClicked ? Color(0Xff393F4E) : Color(0XffBFD1FF),
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
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/ava1.png",
                              height: 50,
                              width: 50,
                            ),
                          ),


                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {

                          setState(() {
                            colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava2Color=Color(0xffBFD1FF);

                            avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava2.png?alt=media&token=e19cd95b-6012-4fe7-94bb-003c1b9f92c0";

                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava2Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava2.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava3Color=Color(0xffBFD1FF);
                            avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava3.png?alt=media&token=d0a90643-c6f3-446e-a386-8de3dc052765";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava3Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava3.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava5Color=Color(0xffBFD1FF);

                            avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava5.png?alt=media&token=6a354ce9-d45a-4bfa-8c26-6d1db00ceb84";

                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava5Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava5.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava6Color=Color(0xffBFD1FF);

                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava6.png?alt=media&token=445f480e-c646-45b1-b55c-8ff86469e97f";

                          });

                        }, // Handle your onTap
                        child: Ink(
                          color:Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava6Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava6.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava7Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava7.png?alt=media&token=41f409b7-6c19-4827-9723-fbd8856215f2";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color:ava7Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava7.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava9Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava9.png?alt=media&token=f9048bb1-fd25-48fe-95ed-65f70f0607b3";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava9Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava9.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava10Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava10.png?alt=media&token=881f92b8-973a-462a-8a3c-8c6f70cd888b";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava10Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava10.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava11Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava11.png?alt=media&token=26a5711e-2a8c-449e-bc3a-4a2d98811cc1";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava11Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava11.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava13Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava13.png?alt=media&token=82a5dece-0e9a-4e2c-824a-1c4b441073bc";


                          });




                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava13Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava13.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava14Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava14.png?alt=media&token=bb2e7b65-2709-432b-add4-cac32bf3cd6d";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava14Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava14.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava15Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava15.png?alt=media&token=fea2cbe9-2359-4577-a113-562e54341031";


                          });



                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava15Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava15.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava17Color=Color(0xffBFD1FF);

                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava17.png?alt=media&token=4d7eacfd-d75e-432d-bf6d-bc95acdb3ebf";

                          });



                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava17Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava17.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava18Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava18.png?alt=media&token=2e1493eb-905a-47cc-b86c-0540d5a7561c";



                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava18Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava18.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava19Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava19.png?alt=media&token=faa84af3-2195-46b7-a44f-d6b272698443";


                          });



                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color:ava19Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava19.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava21Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava21.png?alt=media&token=d32fccfd-57c3-4f07-99c6-0da9cc921d5e";


                          });




                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava21Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava21.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava22Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava22.png?alt=media&token=37793d6e-55bf-4be6-9c3e-b49f69cb25f8";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava22Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava22.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {

                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava23Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava23.png?alt=media&token=c4fe300d-b6cb-4102-b956-082c89ed6bcb";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava23Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava23.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava25Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava25.png?alt=media&token=c2eec723-3f40-4dc6-a294-caa4db20cf66";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava25Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava25.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava26Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava26.png?alt=media&token=2cd731f2-e525-49b3-ac81-dc939cbd82fe";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava26Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava26.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),

                    ),

                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                          // firstColor=Colors.red;
                          //  firstColor= Color(0XffBFD1FF);
                          //  print(firstColor.value.toString());
                          ava24Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava24.png?alt=media&token=35520f68-1000-4c84-b8ed-56b2bf64b14f";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava24Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava24.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),

                  ],
                ),



















                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            colorSetter();
                            // firstColor=Colors.red;
                            //  firstColor= Color(0XffBFD1FF);
                            //  print(firstColor.value.toString());
                            ava4Color=Color(0xffBFD1FF);
                            avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava4.png?alt=media&token=ff5f2d52-eb31-4d55-af59-2de2ecda6a51";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava4Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava4.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),


                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                          // firstColor=Colors.red;
                          //  firstColor= Color(0XffBFD1FF);
                          //  print(firstColor.value.toString());
                          ava8Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava8.png?alt=media&token=4a3682cc-3242-4582-b3c3-fff6591b7af5";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava8Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava8.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),






                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                          // firstColor=Colors.red;
                          //  firstColor= Color(0XffBFD1FF);
                          //  print(firstColor.value.toString());
                          ava12Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava12.png?alt=media&token=e09e3572-c79d-4bb3-9756-29f18967f0db";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava12Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava12.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                          // firstColor=Colors.red;
                          //  firstColor= Color(0XffBFD1FF);
                          //  print(firstColor.value.toString());
                          ava16Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava16.png?alt=media&token=f31d2368-92f4-4e82-a384-aaabf11c6dc3";


                          });

                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ava16Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava16.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() { colorSetter();
                          // firstColor=Colors.red;
                          //  firstColor= Color(0XffBFD1FF);
                          //  print(firstColor.value.toString());
                          ava20Color=Color(0xffBFD1FF);
                          avatarSelected = "https://firebasestorage.googleapis.com/v0/b/mindscape-3a832.appspot.com/o/avatarIcons%2Fava20.png?alt=media&token=b7aee3f8-a774-4ceb-9be9-4bd4dba39b04";


                          });


                        }, // Handle your onTap
                        child: Ink(
                          color: Color(0Xff393F4E),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color:ava20Color,
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
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ava20.png",
                                height: 50,
                                width: 50,
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


          ]),

      actions: [
        continueButton,
      ],
    );
  }
}
