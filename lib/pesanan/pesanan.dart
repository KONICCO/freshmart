import 'package:bisa/cart/cartmodel.dart';
import 'package:bisa/cart/databasecart.dart';
import 'package:bisa/cart/detailcart.dart';
import 'package:bisa/kategori/cartuser.dart';
import 'package:bisa/pesanan/pesananUser.dart';
import 'package:bisa/profile/components/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  final pesananUser pesanan;
  Pesanan(this.pesanan, {Key? key}) : super(key: key);

  @override
  State<Pesanan> createState() => _PesananState(pesanan);
}

class _PesananState extends State<Pesanan> {
  final pesananUser _pesanan;
  _PesananState(this._pesanan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.shopping_cart),
              Text('Keranjangku'),
            ],
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc()
              .collection("cart")
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ],
                      );
                    });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      '\Rp 10.000-,',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                Container(
                  width: 120,
                  height: 70,
                  color: Colors.lightGreen,
                  child: Center(
                      child: Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}