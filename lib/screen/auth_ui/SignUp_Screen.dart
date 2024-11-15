import 'package:e_com/controller/Sign-Up-Controller.dart';
import 'package:e_com/screen/auth_ui/Signin-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app-constant.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {

  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userphone = TextEditingController();
  TextEditingController usercity = TextEditingController();
  TextEditingController userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: AppConstant.appTextColor, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
              children: [

                SizedBox(
                  height: Get.height/20,
                ),

                Text("Welcome to my app",style: TextStyle(fontSize: 20,color: AppConstant.appMainColor,fontWeight: FontWeight.bold),),

                SizedBox(
                  height: Get.height/20,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: username,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "UserName",
                          prefixIcon: Icon(Icons.person,color: Colors.grey,),
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
                    child: TextFormField(
                      controller: userphone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone,color: Colors.grey,),
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
                    child: TextFormField(
                      controller: usercity,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          hintText: "City",
                          prefixIcon: Icon(Icons.location_on,color: Colors.grey,),
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
                    child: TextFormField(
                      controller: useremail,
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
                    child: Obx(() =>  TextFormField(
                      obscureText: signUpController.isPasswordVisible.value,
                      controller: userpassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password,color: Colors.grey,),
                          suffixIcon: GestureDetector(
                              onTap: (){
                                signUpController.isPasswordVisible.toggle();
                              },
                              child:  signUpController.isPasswordVisible.value? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                          ),
                          contentPadding: EdgeInsets.only(top: 2.0,left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                    ),)
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
                      onPressed: () async{
                        String name = username.text.trim();
                        String phone = userphone.text.trim();
                        String city = usercity.text.trim();
                        String email = useremail.text.trim();
                        String password = userpassword.text.trim();
                        String isDeviceTocken =  '';

                        if(name.isEmpty || phone.isEmpty || city.isEmpty || email.isEmpty || password.isEmpty)
                          {
                            Get.snackbar("Error", "Please enter all details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor,
                            );
                          }
                        else{
                          UserCredential? userCredential = await signUpController.signUpMethod(name, email, phone, city, password, isDeviceTocken);
                        };
                        if(UserCredential !=null)
                          {
                            Get.snackbar("Verification email sent", "Please check your email.",
                            snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondryColor,
                                colorText: AppConstant.appTextColor,
                            );
                            FirebaseAuth.instance.signOut();
                            Get.offAll(()=>Signin_Screen());
                          }

                      },
                      child:  Text(
                        "SIGN UP",
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
                      "Already have an account? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppConstant.appMainColor),
                    ),

                    GestureDetector(
                      onTap: () => Get.offAll(() => Signin_Screen()),
                      child: Text(
                        "Sign In",
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
  }
}
