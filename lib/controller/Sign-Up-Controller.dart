import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/model/user-model.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //password visubality

  var isPasswordVisible = true.obs;

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceTocken,
  ) async {
    try {
      EasyLoading.show(status: "Please wait...");

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword);

      // user verification on Email

      userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceTocken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity,
      );

      //add data into database
      _firestore
         .collection("user")
      .doc(userCredential.user!.uid)
      .set(userModel.toMap());

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
