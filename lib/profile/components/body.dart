import 'package:bisa/map.dart';
import 'package:bisa/ubahProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          ProfileMenu(
            text: "Akun saya",
            icon: "images/icon/User_Icon.svg",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return UbahProfil();
              }))
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "images/icon/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "images/icon/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Lokasi Toko",
            icon: "images/icon/Question_mark.svg",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return MapController();
              }));
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "images/icon/Log_out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
