import 'package:bisa/customer.dart';
import 'package:bisa/kategori.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:bisa/modul/model.dart';

import 'package:bisa/admin/kategori/kategori.dart';
import 'admin/admin.dart';
import 'customer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return contro();
  }
}

class contro extends StatefulWidget {

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  routing() {
    if (rooll == 'Customer') {
      return customer(
        id: id,
      );
    } else {
      return Admin(
        id: id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}
