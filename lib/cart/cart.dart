import 'package:bisa/admin/database_services.dart';
import 'package:bisa/cart/cart2.dart';
import 'package:bisa/cart/cartmodel.dart';
import 'package:bisa/cart/databasecart.dart';
import 'package:bisa/cart/detailcart.dart';
import 'package:bisa/kategori/cartuser.dart';
import 'package:bisa/profile/components/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class cart extends StatefulWidget {
  final Usercart usercart;

  cart(this.usercart, {Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState(usercart);
}

class _cartState extends State<cart> {
  final Usercart _usercart;
  _cartState(this._usercart);
  List profil = [];
  List pesanan = [];
  //int total = 0;
  final inputKantong = new TextEditingController();
  User? _auth = FirebaseAuth.instance.currentUser;
  //String myId = '';
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  CollectionReference _produkRef =
      FirebaseFirestore.instance.collection('users');
  // String namalengkap = '';
  // Future initialize() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc("${_usercart.userid}")
  //       .get() as DocumentSnapshot<Object?>;
  //   setState(() {
  //     pesanan.add(snap);
  //   });

  //   print('snap');
  // }

  Future<void> getData() async {
    // Get docs from collection reference
    DocumentReference<Object?> querySnapshot =
        await _collectionRef.doc("${_usercart.userid}");
    // Get data from docs and convert map to List
    final coba = querySnapshot.snapshots().toList();
    //pesanan.add(coba);
    final allData = querySnapshot.get().then(
      (value) {
        setState(() {
          profil.add(value.data());
          //print(profil[0]['uid']);
        });

        ///value['nama'];
      },
    );
    //print(allData);
  }
  // Future<void> getproduk() async {
  //   // Get docs from collection reference
  //   DocumentReference<Object?> querySnapshot =
  //       await _produkRef.doc("${_usercart.userid}").collection('cart').doc();
  //   // Get data from docs and convert map to List
  //   //pesanan.add(coba);
  //   final produk = querySnapshot.docs.forEach.then(
  //     (value) {
  //       pesanan.add(value.data());

  //       ///value['nama'];
  //     },
  //   );
  //   //print(allData);
  // }
  Future<void> _onPressed() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc("${_usercart.userid}")
        .collection("cart")
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            pesanan.add(result.data());
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
    getData();
    //getproduk();
    _onPressed();
    //print(snap);
    //print(pesanan);
  }

  num total = 0;
  setTotal(pesanan) {
    num initTotal = 0;
    for (var i = 0; i < pesanan.length; i++) {
      initTotal = initTotal + (pesanan[i]['price'] * pesanan[i]['jumlahbeli']);
    }
    total = initTotal;
    return total;
  }

  void setDetail() {
    for (var i = 0; i < pesanan.length; i++) {
      databasecart.kantongdetail(
        profil[0]['uid'],
        inputKantong.text.trim(),
        pesanan[i]['id'],
        name: pesanan[i]['name'],
        img: pesanan[i]['img'],
        price: pesanan[i]['price'],
        jumlahbeli: pesanan[i]['jumlahbeli'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                print(profil[0]['uid']);
                //pesanan.clear();
                setState(() {
                  print(pesanan);
                });
              }),
              icon: Icon(Icons.refresh))
        ],
        title: Row(
          children: [
            Icon(Icons.shopping_cart),
            Text('Keranjangku'),
          ],
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: pesanan.length,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 10,
              top: 5,
              right: 10,
              bottom: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 5, blurRadius: 5)
                ]),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pesanan[index]['img'])),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "${pesanan[index]['name']}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Harga: ${pesanan[index]['price']}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Jumlah: ${pesanan[index]['jumlahbeli']}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      MaterialButton(
                        height: 30,
                        color: Colors.lightGreen,
                        textColor: Colors.white,
                        child: Text('Edit'),
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return keranjangdetail(
                              iduser: profil[0]['uid'],
                              detail: index,
                              data: pesanan,
                            );
                          }));
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 70,
        width: double.infinity,
        color: Colors.lightGreen,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: Rp ${setTotal(pesanan)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            MaterialButton(
              height: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              textColor: Colors.lightGreen,
              child: Text('Checkout'),
              onPressed: (() {
                myAlert(context);
              }),
            ),
          ],
        ),
      )),
    );
  }

  void myAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Masukan nama kantong belanjaan kamu'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: inputKantong,
                ),
                ElevatedButton(
                  onPressed: () async {
                    databasecart.kantongcart(
                      profil[0]['uid'],
                      name: profil[0]['nama'],
                      kantong: inputKantong.text.trim(),
                      alamat: profil[0]['alamat'],
                    );
                    setDetail();
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Text('Beli sekarang'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
