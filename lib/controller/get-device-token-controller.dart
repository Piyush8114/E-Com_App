import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../utils/app-constant.dart';

class GetDeviceTokenController extends GetxController{
  String? deviceToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDeviceToken();
  }
  Future<void> getDeviceToken() async{
    try{
      String? token = await FirebaseMessaging.instance.getToken();
      if(token != null)
        {
          deviceToken = token;
          update();
        }
    }
    catch(e){
      Get.snackbar("error", "$e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstant.appSecondryColor,
      colorText: AppConstant.appTextColor);
    }
}

}