import 'package:bisa/controllers/auth_controller.dart';
import 'package:bisa/login_screen.dart';
import 'package:bisa/map.dart';
import 'package:bisa/notifikasi.dart';
import 'package:bisa/ubahProfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profilemenu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Profilemenu(
            text: "Akun saya",
            icon: "images/icon/User_Icon.svg",
            press: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext ctx) {
              //   return UbahProfil();
              // }))
            },
          ),
          Profilemenu(
            text: "Notifications",
            icon: "images/icon/Bell.svg",
            press: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => Notifikasi()),
              //   (Route<dynamic> route) => false,
              // );
            },
          ),
          Profilemenu(
            text: "Settings",
            icon: "images/icon/Settings.svg",
            press: () {},
          ),
          Profilemenu(
            text: "Lokasi Toko",
            icon: "images/icon/Question_mark.svg",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return MapController();
              }));
            },
          ),
          Profilemenu(
            text: "Log Out",
            icon: "images/icon/Log_out.svg",
            press: () {
              logout(context);
            // Navigator.pushAndRemoveUntil(
            // context,
            // MaterialPageRoute(builder: (context) => LoginScreen()),
            // (Route<dynamic> route) => false,);
            } ,
          ),
        ],
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
