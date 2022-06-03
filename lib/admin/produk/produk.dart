
import 'package:bisa/admin/produk/tambahproduk.dart';
import 'package:bisa/chat/screens/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../modul/menu.dart';
import 'cardproduk.dart';
import 'menuproduk.dart';
import 'package:bisa/admin/database_services.dart';
class produk extends StatefulWidget {
  String img;
  String name;
  produk( this.img, this.name, {Key? key}) 
  : super(key: key);

  @override
  _produkState createState() => _produkState(img,name);
}

class _produkState extends State<produk> {
  // This holds a list of fiction Item
  // You can use data fetched from a database or a server as well
  String _img;
  String _name;

  _produkState(this._img, this._name);
  String name= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return tambahproduk(addproduk(nama: _name));
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
            return cardproduk(Menuproduk(id: data['id'],img: data['img'],name: data['name'],price: data['price'],stock: data['stock'], deskripsi: data['deskripsi']));
          }
        );
        }
      ),

      
    );
  }
  
}
