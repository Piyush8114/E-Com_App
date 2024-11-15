import 'package:e_com/screen/auth_ui/SignIn-screen.dart';
import 'package:e_com/screen/auth_ui/Splash-Screen.dart';
import 'package:e_com/screen/auth_ui/welcome-screen.dart';
import 'package:e_com/screen/user_panel/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Splash_Screen()
        home: Splash_Screen(),
        builder: EasyLoading.init(),
    );
  }
}
// kumarpiyush13112003@gmail.com