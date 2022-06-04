import 'package:bisa/kategori/cardkategori.dart';
import 'package:bisa/notifikasi.dart';
import 'package:flutter/material.dart';
import '../produk/buah.dart';
import '../cart/cart.dart';
import 'package:bisa/modul/menu.dart';
import '../sayur.dart';
import 'cardkategori.dart';
import '../profile/profile_screen.dart';
import '../main.dart';
import '../chat/screens/chatscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../login_screen.dart';
import '../modul/model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Kategori extends StatefulWidget {
  @override
  _KategoriState createState() => _KategoriState();
}
class _KategoriState extends State<Kategori> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
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
              padding: EdgeInsets.all(10.0),
              child: IconButton(onPressed: () {
                Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return chatscreen();
                  }));
              }, icon: Icon(Icons.message))),
        ],
        title: Container(
          width: 300,
          height: 37,
          child: Center(
            child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
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
                  .collection("seacrhItems")
                  .where("search".toLowerCase(),
                      arrayContains: name.toLowerCase())
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection("seacrhItems")
                  .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return cardkategori(
                          Menu(img: data["img"], name: data["name"]));
                    });
          }),
      
    );
  }
}
