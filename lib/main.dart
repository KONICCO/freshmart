import 'package:bisa/buah.dart';
import 'package:bisa/controllers/auth_controller.dart';
import 'package:bisa/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'splash_screen.dart';
import 'kategori.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference UsersRef = FirebaseDatabase.instance.ref().child("users");
class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                '/buah': (BuildContext context) => Buah(),
              },
              theme: ThemeData(
                primaryColor: Color(0xFF01afbd),
              ),
              home: snapshot.data != null ? Kategori() : LoginScreen(),
            );
          }
          return SplashScreen();
        });
  }
}
