import 'package:e_com/screen/user_panel/Contect-us-screen.dart';
import 'package:e_com/screen/user_panel/all-order-screen.dart';
import 'package:e_com/screen/user_panel/all-product-screen.dart';
import 'package:e_com/screen/user_panel/main_screen.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screen/auth_ui/welcome-screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: Get.height/25),
    child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )
        ),
      child: Wrap(
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("PK",
                style:TextStyle(fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
              ),
              subtitle: Text("Version 1.0.1",
                style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: CircleAvatar(
                radius: 22.0,
                backgroundColor: AppConstant.appMainColor,

                child: Text("P",style:TextStyle(color: AppConstant.appTextColor),
                ),
              ),
            ),
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: Colors.grey,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Home",
                style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(Icons.home,color: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              onTap: (){
                Get.offAll(()=> main_screen());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Products",
                style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(Icons.production_quantity_limits,color: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              onTap: (){
                Get.to(()=> AllProductScreen());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Orders",
                style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(Icons.shopping_bag,color: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.white,),

              onTap: (){
                Get.back();
                Get.to(()=>AllOrdersScreen());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Contact",
                style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(Icons.help,color: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.white,),

              onTap: (){
                Get.back();
                Get.to(()=>ContectUS());
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(

              onTap: ()async{
                FirebaseAuth _auth = FirebaseAuth.instance;
                GoogleSignIn googleSignIn = GoogleSignIn();
                await _auth.signOut();
                await googleSignIn.signOut();
                Get.offAll(()=> Welcome_Screen());
              },

              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Logout",
              style:TextStyle(color: AppConstant.appTextColor),
              ),
              leading: Icon(Icons.logout,color: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: AppConstant.appSecondryColor,),
            ),
          ),
        ],
      ),
      backgroundColor: AppConstant.appSecondryColor,
    ),
    );
  }
}
