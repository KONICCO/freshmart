import 'dart:io';
import 'package:bisa/admin/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
class tambahproduk extends StatefulWidget {
  // final addproduk menu;
  // tambahproduk(this.menu)
  String nama;

  tambahproduk(this.nama, {Key? key})
  : super(key: key);
  @override
  State<tambahproduk> createState() => _tambahprodukState(nama);
}

class _tambahprodukState extends State<tambahproduk> {
  String _nama;
  // final addproduk _menu;
  _tambahprodukState(this._nama);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}