import 'dart:async';
import 'package:e_com/screen/auth_ui/welcome-screen.dart';
import 'package:e_com/screen/user_panel/main_screen.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/Get-User-Data-Controller.dart';
import '../admin_penal/Admin-main-screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
     // Get.offAll(()=> Welcome_Screen());
      loggdin(context);
    });
  }

  Future<void> loggdin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());

      } else {
        Get.offAll(() => main_screen());
      }
    } else {
      Get.to(() => Welcome_Screen());
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                   width: Get.width,
                  child: Lottie.asset("assets/images/splashs.json")),
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                  fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: AppConstant.appTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
