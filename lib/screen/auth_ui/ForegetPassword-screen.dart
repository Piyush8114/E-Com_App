import 'package:e_com/controller/Forget_Password_Controller.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =Get.put(ForgetPasswordController());
  TextEditingController userEmail  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor,
          title: Text(
            "Forget Password",
            style: TextStyle(
                color: AppConstant.appTextColor, fontWeight: FontWeight.bold),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            child: Column(
                children: [
                  isKeyboardVisible ? Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Welcome to my app",style: TextStyle(fontSize: 20,color: AppConstant.appMainColor,fontWeight: FontWeight.bold),))
                      : Column(
                    children: [
                      Container(
                        color: AppConstant.appMainColor,
                        child: Lottie.asset("assets/images/splash.json"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height/20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,color: Colors.grey,),
                            contentPadding: EdgeInsets.only(top: 2.0,left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Get.height/20,
                  ),

                  Material(
                    child: Container(
                      width: Get.width/2,
                      height: Get.height/18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppConstant.appMainColor
                      ),
                      child: TextButton(
                        onPressed: () async {
                          String email = userEmail.text.trim();

                          if(email.isEmpty)
                          {
                            Get.snackbar("Error", "Please enter all details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor
                            );
                          }
                          else{
                            String email = userEmail.text.trim();
                            forgetPasswordController.ForgetPasswordMethod(email);
                          }
                        },

                        child:  Text(
                          "FORGET",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppConstant.appTextColor),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      );
    },);
  }
}
