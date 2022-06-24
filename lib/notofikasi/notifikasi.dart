import 'package:bisa/kategori/kategori.dart';
import 'package:bisa/profile/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  List profil = [];
  List notif = [];
  //int total = 0;
  final inputKantong = new TextEditingController();
  User? _auth = FirebaseAuth.instance.currentUser;
  //String myId = '';
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  CollectionReference _notifRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> _onPressed() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc("${_auth!.uid}")
        .collection("notif")
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            notif.add(result.data());
          });

          // print(result.data());
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //initialize();
    //getproduk();
    _onPressed();
    //print(snap);
    //print(pesanan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: notif.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ListTile(
                      leading: Image(image: AssetImage("images/logo.jpeg")),
                      title: Text('${notif[index]['notif']}'),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
