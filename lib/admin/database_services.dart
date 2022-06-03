
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


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
  get json => addproduk( nama: this.nama);
}