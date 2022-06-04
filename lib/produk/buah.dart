import 'package:bisa/produk/cardbuah.dart';
import 'package:bisa/cart/cart.dart';
import 'package:bisa/chat/screens/chatscreen.dart';
import 'package:bisa/notifikasi.dart';
import 'package:bisa/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../signup_screen.dart';
import '../kategori/kategori.dart';
import 'pagebuah1.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bisa/modul/menuhbuah.dart';
class Buah extends StatefulWidget {
  String img;
  String name;
  Buah( this.img, this.name, 
  {Key? key}) 
  : super(key: key);

  @override
  _BuahState createState() => _BuahState(img,name);
}

class _BuahState extends State<Buah> {
  // This holds a list of fiction Item
  // You can use data fetched from a database or a server as well
  String _img;
  String _name;

  _BuahState(this._img, this._name);
  String name= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return cart();
                  }));
                }),
          ),
          Padding(
            padding:  EdgeInsets.all(10.0),
            child: IconButton(onPressed: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return chatscreen();
                  }));
              }, icon: Icon(Icons.message))
          ),
        ],
        title: Container(
          width: 300,
          height: 37,
          child: Center(
            child: TextField(
              onChanged: (val) {setState(() {
                  name = val;
                });},
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(bottom: -10.0, left: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Cari buah, sayur, beras...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
          ? FirebaseFirestore.instance
              .collection(_name)
              .where("search".toLowerCase(), arrayContains: name.toLowerCase())
              .snapshots()
          : FirebaseFirestore.instance.collection(_name).snapshots(),
        builder: (context, snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
            ? Center(child: CircularProgressIndicator())
            : 
            GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) { 
            DocumentSnapshot data = snapshot.data!.docs[index];
            return cardbuah(Menubuah(id: data['id'],img: data['img'],name: data['name'],price: data['price'],stock: data['stock'], deskripsi: data['deskripsi']));
          }
        );
        }
      ),

      
    );
  }
}
