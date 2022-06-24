import 'dart:io';

import 'package:bisa/kategori/kategori.dart';
import 'package:bisa/login_screen.dart';
import 'package:bisa/modul/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';
import 'produk/buah.dart';
import 'kategori/kategori.dart';

class SignUpScreen extends StatelessWidget {
  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController nomorTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Customer',
  ];
  var _currentItemSelected = "Customer";
  var rool = "Customer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formkey,
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: Color.fromARGB(255, 245, 243, 242),
              gradient: LinearGradient(
                colors: [(Colors.white), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "images/logo.jpeg",
                    height: 90,
                    width: 90,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Daftar",
                    style: TextStyle(fontSize: 20, color: Colors.lightGreen),
                  ),
                )
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: nameTextEditingController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.lightGreen,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.lightGreen,
                ),
                hintText: "Nama Lengkap",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.length == 0) {
                  return "name cannot be empty";
                }
                if (!RegExp("^[a-zA-Z].[a-z]").hasMatch(value)) {
                  return ("Please enter a valid name");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.lightGreen,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.lightGreen,
                ),
                hintText: "Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 14.0),
              ),
              validator: (value) {
                if (value!.length == 0) {
                  return "Email cannot be empty";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please enter a valid email");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: nomorTextEditingController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.lightGreen,
              decoration: InputDecoration(
                focusColor: Colors.lightGreen,
                icon: Icon(
                  Icons.phone,
                  color: Colors.lightGreen,
                ),
                hintText: "Nomor Telepon",
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 14.0),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.length == 0) {
                  return "Number cannot be empty";
                }
                if (!RegExp("^[0-9]").hasMatch(value)) {
                  return ("Please enter a valid number");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: passwordTextEditingController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.lightGreen,
              decoration: InputDecoration(
                focusColor: Colors.lightGreen,
                icon: Icon(
                  Icons.vpn_key,
                  color: Colors.lightGreen,
                ),
                hintText: "Masukkan Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                RegExp regex = new RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
                if (!regex.hasMatch(value)) {
                  return ("please enter valid password min. 6 character");
                } else {
                  return null;
                }
              },
              onChanged: (value) {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rool : ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 37, 216, 37),
                ),
              ),
              DropdownButton<String>(
                dropdownColor: Color.fromARGB(255, 255, 255, 255),
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Color.fromARGB(255, 17, 6, 6),
                focusColor: Color.fromARGB(255, 129, 42, 42),
                items: options.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Color.fromARGB(255, 204, 88, 88),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState() {
                    _currentItemSelected = newValueSelected!;
                    rool = newValueSelected;
                  }

                  ;
                },
                value: _currentItemSelected,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              signUp(
                  nameTextEditingController.text,
                  emailTextEditingController.text,
                  nomorTextEditingController.text,
                  passwordTextEditingController.text,
                  rool);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(Colors.lightGreen), Colors.lightGreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Text(
                "DAFTAR",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah Mempunyai Akun?  "),
                GestureDetector(
                  child: Text(
                    "Masuk Sekarang",
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    )));
  }

  void signUp(String nama, String email, String nomor, String password,
      String rool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(nama, email, nomor, rool)})
          .catchError((e) {});
    }
  }

  displayToastMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${message}"),
    ));
  }

  postDetailsToFirestore(
      String nama, String email, String nomor, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = email;
    userModel.uid = user!.uid;
    userModel.wrool = rool;
    userModel.nama = nama;
    userModel.nomor = nomor;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
