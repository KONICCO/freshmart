import 'package:bisa/map.dart';
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
          SizedBox(height: 20),
          ProfileMenu(
            text: "Ubah Profil",
            //style: TextStyle(color: Colors.white),
            icon: "images/icon/User_Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Syarat dan Ketentuan",
            //style: TextStyle(color: Colors.white),
            icon: "images/icon/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Kebijakan Privasi",
            //style: TextStyle(color: Colors.white),
            icon: "images/icon/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
              text: "Lokasi Toko",
              //style: TextStyle(color: Colors.white),
              icon: "images/icon/Question_mark.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext ctx) {
                  return MapController();
                }));
              }),
          ProfileMenu(
            text: "Log Out",
            //style: TextStyle(color: Colors.white),
            icon: "images/icon/Log_out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
