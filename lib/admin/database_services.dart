
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class DatabaseServices{
  static CollectionReference kategori = FirebaseFirestore.instance.collection("seacrhItems");
  
  static Future<void> createOrUpdateKategori(int? id,{ String? name, String? img, search, }) async {
    await  kategori.doc("${id}").set({
      'name': name,
      'img': img,
      'search': search,
      "id": id
    });
  }
  static Future<void> hapuskategori( int kategoriid,) async {
    CollectionReference kategorihapus = FirebaseFirestore.instance.collection("seacrhItems");
    await  kategorihapus.doc("$kategoriid").delete();
  }
  static Future<void> editKategori(int? id, {String? name, String? img, search}) async {
    CollectionReference editkategori = FirebaseFirestore.instance.collection("seacrhItems");
    await  editkategori.doc("${id}").set({
      'name': name,
      'img': img,
      'search': search,
      "id": id
    });
  }
  static Future<void> createOrUpdateProduk( String kolek, {int? id, String? name, String? img,int? price,int? stock, String? deskripsi, search}) async {
    CollectionReference produk = FirebaseFirestore.instance.collection(kolek);
    await  produk.doc("${id}").set({
      'id': id,
      'name': name,
      'img': img,
      'price': price,
      'stock': stock,
      'deskripsi': deskripsi,
      'search': search,
    });
  }
  static Future<void> UpdateProduk( String kolek, int id,{ String? name, String? img,int? price,int? stock, String? deskripsi, search}) async {
    CollectionReference produk = FirebaseFirestore.instance.collection("${kolek}");
    await  produk.doc("${id}").set({
      'id': id,
      'name': name,
      'img': img,
      'price': price,
      'stock': stock,
      'deskripsi': deskripsi,
      'search': search,
    });
  }
  static Future<void> hapusproduk( String kolek,int produkid,) async {
    CollectionReference produkhapus = FirebaseFirestore.instance.collection("${kolek}");
    await  produkhapus.doc("$produkid").delete();
  }
  // DatabaseServices.createOrUpdateProduct(
  //                 name: "sayur", 
  //                 img: "sayur", 
  //                 search: ["sayur"]);

  static Future<String> uploadimage(File imageFile) async{
    String filename = basename(imageFile.path);
    Reference ref =FirebaseStorage.instance.ref().child(filename);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    return await snapshot.ref.getDownloadURL();
  }
}

class addproduk{
  String nama;

  addproduk({
    required this.nama,
  });
  
}