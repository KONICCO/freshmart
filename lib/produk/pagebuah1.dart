//import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';

import 'cardbuah.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import '../signup_screen.dart';
import '../kategori/kategori.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database.dart';

class pagebuah1 extends StatefulWidget {
  int id;
  String img;
  String name;
  int price;
  int stock;
  String deskripsi;
  pagebuah1(
      this.id, this.img, this.name, this.price, this.stock, this.deskripsi,
      {Key? key})
      : super(key: key);

  @override
  State<pagebuah1> createState() =>
      _pagebuah1State(id, img, name, price, stock, deskripsi);
}

class _pagebuah1State extends State<pagebuah1> {
  int _id;
  String _img;
  String _name;
  int _price;
  int _stock;
  String _deskripsi;
  _pagebuah1State(this._id, this._img, this._name, this._price, this._stock,
      this._deskripsi);
  // final databaseReference = FirebaseDatabase.instance.ref();

  // // final firebaseUser = FirebaseAuth.instance.currentUser;
  // void createData(){
  // databaseReference.child("flutterDevsTeam1").set({
  //   'name': 'Deepak Nishad',
  //   'description': 'Team Lead'
  // });
  // databaseReference.child("flutterDevsTeam2").set({
  //   'name': 'Yashwant Kumar',
  //   'description': 'Senior Software Engineer'
  // });
  // databaseReference.child("flutterDevsTeam3").set({
  //   'name': 'Akshay',
  //   'description': 'Software Engineer'
  // });
  // databaseReference.child("flutterDevsTeam4").set({
  //   'name': 'Aditya',
  //   'description': 'Software Engineer'
  // });
  // databaseReference.child("flutterDevsTeam5").set({
  //   'name': 'Shaiq',
  //   'description': 'Associate Software Engineer'
  // });
  // databaseReference.child("flutterDevsTeam6").set({
  //   'name': 'Mohit',
  //   'description': 'Associate Software Engineer'
  // });
  // databaseReference.child("flutterDevsTeam7").set({
  //   'name': 'Naveen',
  //   'description': 'Associate Software Engineer'
  // });}
  // void createData() {
  //   databaseReference.child(firebaseUser!.uid).
  //   set({
  //     'name': 'Deepak Nishad',
  //     'img': 'Team Lead',
  //     'jumlahbeli': 'test',
  //     'price': 'test',
  //   });
  // }

  int i = 1;
  void _minus() {
    if (i > 1) {
      setState(() {
        i--;
      });
    }
  }

  void _plus() {
    setState(() {
      i++;
    });
  }

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 300,
                    // margin:  EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(25),
                        //   topRight: Radius.circular(25),
                        // ),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(_img))),
                  ),
                  Container(
                    color: Colors.white,
                    width: 500,
                    // margin:  EdgeInsets.only(left: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, bottom: 8, top: 8),
                              child: Text(
                                '${_name}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                right: 10, left: 10, bottom: 8, top: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(
                                    _price,
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  'Stock: ${_stock}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 7,
                              color: Color.fromARGB(255, 252, 252, 252)),
                          Container(
                            margin:
                                EdgeInsets.only(right: 10, left: 10, top: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi Produk',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${_deskripsi}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: _minus,
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '${i}',
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: _plus,
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // margin:  EdgeInsets.only(left: 100, bottom: 80),
                  height: 40,
                  width: 200.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // minimumSize: Size(50, 40), //////// HERE
                    ),
                    onPressed: () async {
                      
                      User? user = _auth.currentUser;
                      database.createOrUpdatecart(
                        user!.uid,
                        _id,
                        name: _name,
                        img: _img,
                        price: _price,
                        jumlahbeli: i,
                      );
                      Navigator.pop(context);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: const Text('Barang sudah ditambahkan'),
                      //     action: SnackBarAction(
                      //       label: 'Tutup',
                      //       onPressed: () {
                      //         // Code to execute.
                      //       },
                      //     ),
                      //   ),
                      // );
                    },
                    child: Text('+ Keranjang'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
