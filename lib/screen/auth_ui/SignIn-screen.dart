import 'package:e_com/controller/Get-User-Data-Controller.dart';
import 'package:e_com/controller/Sign-in-controller.dart';
import 'package:e_com/screen/admin_penal/Admin-main-screen.dart';
import 'package:e_com/screen/auth_ui/ForegetPassword-screen.dart';
import 'package:e_com/screen/user_panel/main_screen.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'SignUp_Screen.dart';

class Signin_Screen extends StatefulWidget {
  const Signin_Screen({super.key});

  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  final SignInController signInController =Get.put(SignInController());
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());

  TextEditingController userEmail  = TextEditingController();
  TextEditingController userPassword  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor,
          title: Text(
            "Sign in",
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

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() => TextFormField(
                      controller: userPassword,
                      obscureText: signInController.isPasswordVisible.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password,color: Colors.grey,),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              signInController.isPasswordVisible.toggle();
                            },
                              child: signInController.isPasswordVisible.value ?
                              Icon(Icons.visibility_off) :
                              Icon(Icons.visibility)
                          ),
                          contentPadding: EdgeInsets.only(top: 2.0,left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                    ),)

                  ),
                ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   alignment: Alignment.centerRight,
                   child: GestureDetector(
                       onTap: (){
                         Get.to(()=> ForgetPasswordScreen());
                       },
                       child: Text("Forget Password?",style: TextStyle(fontWeight: FontWeight.bold,color: AppConstant.appMainColor,fontSize: 17),)),
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
                        String password = userPassword.text.trim();

                        if(email.isEmpty || password.isEmpty)
                          {
                            Get.snackbar("Error", "Please enter all details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor
                            );
                          }
                        else{
                          UserCredential? userCredential = await signInController
                              .signInMethod(email, password);

                          if(userCredential != null)
                          {
                            var userData = await getUserDataController.getUserData(userCredential.user!.uid);
                            if(userCredential.user!.emailVerified)
                              {
                                if(userData.isNotEmpty && userData[0]['isAdmin'] == true)
                                  {
                                    Get.offAll(()=>AdminMainScreen());
                                    Get.snackbar("Success Admin Login", "Login Successfully",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: AppConstant.appSecondryColor,
                                        colorText: AppConstant.appTextColor
                                    );
                                  }
                                else{
                                  Get.offAll(()=> main_screen());
                                  Get.snackbar("Success User Login", "Login Successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppConstant.appSecondryColor,
                                      colorText: AppConstant.appTextColor);
                                }
                              }

                            else{
                              Get.snackbar("Error", "Please verify your email before login",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appSecondryColor,
                                  colorText: AppConstant.appTextColor
                              );
                            }
                          }
                          else{
                            Get.snackbar("Error", "Please try again",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor
                            );
                          }
                        }
                      },

                      child:  Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppConstant.appTextColor),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: Get.height/20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppConstant.appMainColor),
                    ),

                       GestureDetector(
                         onTap: () => Get.offAll(() => Signup_Screen()),
                         child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppConstant.appMainColor),
                         ),
                       ),
                  ],
                ),
              ]
            ),
          ),
        ),
      );
    },);
  }
}
