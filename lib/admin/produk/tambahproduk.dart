import 'dart:io';
import 'package:bisa/admin/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class tambahproduk extends StatefulWidget {
  final addproduk menu;

  tambahproduk(this.menu);

  // final addproduk menu;
  // tambahproduk(this.menu)
  
  //String nama;

  //tambahproduk(this.nama, {Key? key}) : super(key: key);
  @override
  State<tambahproduk> createState() => _tambahprodukState(menu);
}

class _tambahprodukState extends State<tambahproduk> {
  //String _nama;
  // final addproduk _menu;
  //_tambahprodukState(this._nama);
  
  final inputid = new TextEditingController();
  final inputtName = new TextEditingController();
  final inputimg = new TextEditingController();
  final inputprice = new TextEditingController();
  final inputstock = new TextEditingController();
  final inputdeskripsi = new TextEditingController();
  List search = [];

  int _charHuruf = 0;
    final addproduk _menu;
  _tambahprodukState(this._menu);

  _onChangedHuruf(String value) {
    setState(() {
      _charHuruf = value.length;
    });
  }

  @override
  void itungan(String name) {
    for (int i = 1; i <= _charHuruf; i++) {
      var result = name.substring(0, i);
      search.add(result);
      //name[0:i+1];

    }
  }

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add Produk'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Produk Information",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Produk Image",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          myAlert(context);
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Color.fromARGB(255, 9, 168, 253),
                          child: imagePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    imagePath!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 100,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10, bottom: 20),
                      //   height: 200,
                      //   child: Center(
                      //     child: Icon(Icons.add, size: 50, color: Colors.blue),
                      //   ),

                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue.shade50,
                      //     border: Border.all(width: 5, color: Colors.blue),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                    ),
                    Text("Produk Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: inputtName,
                        onChanged: _onChangedHuruf,
                        decoration: InputDecoration(
                          counterText: '${_charHuruf}',
                          border: OutlineInputBorder(),
                          hintText: "Buah, Sayur",
                        ),
                      ),
                    ),
                    Text("Produk Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: inputprice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "5",
                        ),
                      ),
                    ),
                    Text("Produk Stock",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: inputstock,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "5",
                        ),
                      ),
                    ),
                    Text("Produk Deskripsi",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: inputdeskripsi,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "lorem",
                        ),
                      ),
                    ),
                    Text("Produk id",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                        controller: inputid,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "5",
                        ),
                      ),
                    ),
                    ElevatedButton(
                        child: Text('add data'),
                        onPressed: () async {
                          itungan(inputtName.text.toLowerCase());
                          //print(imageUrl);

                          DatabaseServices.createOrUpdateProduk(
                              _menu.nama,
                              id: int.parse(inputid.text),
                              name: inputtName.text.toLowerCase(),
                              img: imagePath,
                              price: int.parse(inputprice.text),
                              stock: int.parse(inputstock.text),
                              deskripsi:inputdeskripsi.text.toLowerCase(),
                              search: search,
                              
                              );
                          search.clear();
                        })
                  ]),
            ),
          ),
        ));
  }

  void myAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    XFile? file = await getImage(ImageSource.gallery);
                    File? imagefile = File(file!.path);
                    imagePath = await DatabaseServices.uploadimage(imagefile);
                    
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    XFile? file = await getImage(ImageSource.camera);
                    File? imagefile = File(file!.path);
                    imagePath = await DatabaseServices.uploadimage(imagefile);
                    
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.camera),
                      Text('From Camera'),
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

Future<XFile?> getImage(ImageSource source) async {
  return await ImagePicker().pickImage(source: source);
}