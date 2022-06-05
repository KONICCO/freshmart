




import 'package:cloud_firestore/cloud_firestore.dart';

class database{

  static Future<void> createOrUpdatecart( String userid, int idproduk,{ String? name, String? img,int? price,int? jumlahbeli}) async {
    CollectionReference cart = FirebaseFirestore.instance.collection("users").doc(userid).collection("cart");
    await  cart.doc("$idproduk").set({
      'id': idproduk,
      'name': name,
      'img': img,
      'price': price,
      'jumlahbeli': jumlahbeli,
    });
  }
}