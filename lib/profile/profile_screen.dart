import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:bisa/kategori.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Profile"),
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: Kategori.profile),
    );
  }
}
