import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/model/user-model.dart';
import 'package:e_com/screen/auth_ui/SignIn-screen.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> ForgetPasswordMethod(
      String userEmail,
      ) async {
    try {
      EasyLoading.show(status: "Please wait...");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar("Request send successfully", " Password change link send to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondryColor,
          colorText: AppConstant.appTextColor);

      Get.offAll(()=> Signin_Screen());

      EasyLoading.dismiss();

    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondryColor,
          colorText: AppConstant.appTextColor
      );
    }
  }
}
