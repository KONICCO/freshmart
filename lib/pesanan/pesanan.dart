import 'package:bisa/cart/cartmodel.dart';
import 'package:bisa/cart/databasecart.dart';
import 'package:bisa/cart/detailcart.dart';
import 'package:bisa/kategori/cartuser.dart';
import 'package:bisa/pesanan/cardPesanan.dart';
import 'package:bisa/pesanan/pesananUser.dart';
import 'package:bisa/profile/components/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  User? _auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.delivery_dining),
            Text('Pesanan'),
          ],
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(_auth!.uid)
            .collection("pesanan")
            .orderBy('id')
            .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return cardPesanan(pesananUser(
                      userid: _auth!.uid,
                      namalengkap: data['namalengkap'],
                      namakantong: data['namakantong'],
                      alamat: data['alamat'],
                    ));
                  });
        },
      ),
    );
  }
}
