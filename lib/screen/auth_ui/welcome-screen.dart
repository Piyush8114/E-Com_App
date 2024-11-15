import 'package:e_com/controller/google-sign-in-controller.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'SignIn-screen.dart';

class Welcome_Screen extends StatelessWidget {
   Welcome_Screen({super.key});

  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Welcome to my app",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppConstant.appSecondryColor,
                child: Lottie.asset("assets/images/splash.json"),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Happy Shopping",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: Get.height/12,
              ),
              Material(
                child: Container(
                  width: Get.width/1.2,
                  height: Get.height/12,
                  decoration: BoxDecoration(
                    color: AppConstant.appSecondryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                      onPressed: () {
                        _googleSignInController.SignWithGoogle();
                      },
                      label:  Text(
                        "Sign in with google",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppConstant.appTextColor),
                      ),
                    icon: Image.asset("assets/images/google.png",
                    // height: Get.height/2,
                      height: 40,
                      // width: Get.width/12,
                    )

                  ),
                ),
              ),

              SizedBox(height: 20,),

              Material(
                child: Container(
                  width: Get.width/1.2,
                  height: Get.height/12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppConstant.appSecondryColor
                  ),
                  child: TextButton.icon(
                      onPressed: () {
                        Get.to(Signin_Screen());
                      },
                     label:  Text(
                        "Sign in with email",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppConstant.appTextColor),
                      ),
                    icon: Image.asset("assets/images/gmail.png",
                      height: Get.height/2,
                    width: Get.width/12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
