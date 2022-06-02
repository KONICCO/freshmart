import 'dart:io';

import 'package:bisa/admin/database_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class tambahkategori extends StatefulWidget {
  tambahkategori({Key? key}) : super(key: key);

  @override
  State<tambahkategori> createState() => _tambahkategoriState();
}

class _tambahkategoriState extends State<tambahkategori> {
  final inputtName = new TextEditingController();
  final inputimg = new TextEditingController();
  List search = [];

  int _charHuruf = 0;
  
  _onChangedHuruf(String value) {
  setState(() {
    _charHuruf = value.length;
  });
}
  @override
  void itungan( String name ){
    for (int i=1 ; i <= _charHuruf; i++){
          var result = name.substring(0, i);
          search.add(result);
          //name[0:i+1];
          
    
    }
  }
  //kamra dan file
  File? image;
  late TextEditingController _controller;

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(imageGallery!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add Kategori'),
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
                      "Kategori Information",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Kategori Image",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      height: 200,
                      child: Center(
                        child: Icon(Icons.add, size: 50, color: Colors.blue),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border: Border.all(width: 5, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      
                    ),
                    Text("Kategori Name",
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
                    ElevatedButton(
                child: Text('add data'),
                onPressed: () {
                  itungan( inputtName.text.toLowerCase());
                  
                  DatabaseServices.createOrUpdateProduct(
                      name: inputtName.text.toLowerCase(), 
                      img: "https://images.tokopedia.net/img/cache/500-square/product-1/2018/10/30/32915789/32915789_a13371f1-32d0-4b8a-bd1e-b37b7726799c_2048_1828.jpg", 
                      search: search);
                  search.clear();
                })
                  ]),
            ),
          ),
          
        ));
  }
  
   
}
