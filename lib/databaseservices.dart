
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class DatabaseServices{


    static Future<void> Updateprofil( String id,{ String? name, String? img, String? wrool,String? email, String? nomor ,String? alamat}) async {
    CollectionReference profil = FirebaseFirestore.instance.collection("users");
    await  profil.doc("${id}").set({
      'uid': id,
      'nama': name,
      'img': img,
      'wrool': wrool,
      'email': email,
      'nomor': nomor,
      'alamat': alamat,
    });
  }
  static Future<String> uploadimage(File imageFile) async{
    String filename = basename(imageFile.path);
    Reference ref =FirebaseStorage.instance.ref().child(filename);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    return await snapshot.ref.getDownloadURL();
  }
}
