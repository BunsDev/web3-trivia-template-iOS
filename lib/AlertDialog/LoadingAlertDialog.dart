import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadingAlertDialog {

  final BuildContext context;
   AlertDialog alert;

  LoadingAlertDialog(this.context, this.alert);

  void start(){
    alert = AlertDialog(

      // title: Text("Please SignUp!"),
       //insetPadding: EdgeInsets.symmetric(horizontal: 200,vertical: 0),

      backgroundColor: Color(0xffdee7ff),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          side: BorderSide(
            color: Color(0xff555B68),
          )),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(

          child:  Transform.scale(
            scale: 3.6,
          child:Lottie.asset("assets/loading_anim.json",
              repeat: true, width: 55, height: 55),
        ),
      ),
      ),



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

  void dismiss(){
    Navigator.pop(context, true);
  }



}
