import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseServices{
  static CollectionReference kategori = FirebaseFirestore.instance.collection("seacrhItems");
  
  static Future<void> createOrUpdateProduct({String? name, String? img, search}) async {
    await  kategori.doc().set({
      'name': name,
      'img': img,
      'search': search
    });
  }
  // DatabaseServices.createOrUpdateProduct(
  //                 name: "sayur", 
  //                 img: "sayur", 
  //                 search: ["sayur"]);
}