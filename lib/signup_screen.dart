import 'package:bisa/kategori.dart';
import 'package:bisa/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';
import 'buah.dart';
import 'kategori.dart';
class SignUpScreen extends StatelessWidget {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nomorTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
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
          child: TextField(
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
          child: TextField(
            controller: emailTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.lightGreen,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.lightGreen,
              ),
              hintText: "Email",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
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
          child: TextField(
            controller: nomorTextEditingController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.lightGreen,
            decoration: InputDecoration(
              focusColor: Colors.lightGreen,
              icon: Icon(
                Icons.phone,
                color: Colors.lightGreen,
              ),
              hintText: "Nomor Telepon",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
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
          child: TextField(
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
          child: TextField(
            cursorColor: Colors.lightGreen,
            decoration: InputDecoration(
              focusColor: Colors.lightGreen,
              icon: Icon(
                Icons.vpn_key,
                color: Colors.lightGreen,
              ),
              hintText: "Konfirmasi Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (nameTextEditingController.text.length < 4)
            {
              displayToastMessage("Name must be atleast 3 character", context);
              
            }
            else if(!emailTextEditingController.text.contains("@"))
            {
              displayToastMessage("email is not valid", context);
            }
            else if(nomorTextEditingController.text.isEmpty)
            {
              displayToastMessage("Nomor is not valid", context);
            }
            else if(passwordTextEditingController.text.length < 6)
            {
              displayToastMessage("Password must be atleast 5 character", context);
            }
            else
            {
              registerNewUser(context);
            }
            
          
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
    )));
  }
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async
  {
    final User? firebaseUser = (await _firebaseAuth
    .createUserWithEmailAndPassword(
      email: emailTextEditingController.text, 
      password: passwordTextEditingController.text
      ).catchError((errMsg){
        displayToastMessage("error: " + errMsg.toString(), context);
        print(errMsg);
      })).user;

      if(firebaseUser != null)//info
      {
        //savedatabase
        
        Map userDataMap = 
        {
          "nama": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "nomor": nomorTextEditingController.text.trim()
        };
        DatabaseReference UsersRef = FirebaseDatabase.instance.ref().child("users");
        UsersRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Success", context);
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        //   (Route<dynamic> route) => false,
        // );
      }
      else
      {
        //erorr
        displayToastMessage("New user has not been created", context);
        
      }
  }
  displayToastMessage(String message, BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${message}"),
    ));
    
  }
}
