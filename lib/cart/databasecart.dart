

import 'package:cloud_firestore/cloud_firestore.dart';

class databasecart{
  
  
  // static Future<void> getcart( String userid,) async {
  //   CollectionReference cart = FirebaseFirestore.instance.collection("users").doc(userid).collection("cart");
  //   await  cart.doc().get();
  // }
  static Future<void> updatecart( String userid, int produkid,{ String? name, String? img,int? price,int? jumlahbeli}) async {
    CollectionReference cartupdate = FirebaseFirestore.instance.collection("users").doc(userid).collection("cart");
    await  cartupdate.doc("$produkid").set({
  'id': produkid,
  'name': name,
  'img': img,
  'price': price,
  'jumlahbeli': jumlahbeli,
    }
    );
  }
}