import 'dart:io';
import 'package:bisa/admin/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:bisa/admin/kategori/kategori.dart';
import 'package:bisa/profile/profile_screen.dart';

class editproduk extends StatefulWidget {
  int id;
  String img;
  String name;
  int price;
  int stock;
  String deskripsi;
  String kolek;
  editproduk(this.id,this.img, this.name, this.price, this.stock, this.deskripsi, this.kolek);

  // final addproduk menu;
  // editproduk(this.menu)

  //String nama;

  //editproduk(this.nama, {Key? key}) : super(key: key);
  @override
  State<editproduk> createState() => _editprodukState(id,img,name,price,stock,deskripsi,kolek);
}

class _editprodukState extends State<editproduk> {
  int _id;
  String _img;
  String _name;
  int _price;
  int _stock;
  String _deskripsi;
  String _kolek;
  final inputtName = new TextEditingController();
  final inputimg = new TextEditingController();
  final inputprice = new TextEditingController();
  final inputstock = new TextEditingController();
  final inputdeskripsi = new TextEditingController();
  List search = [];

  int _charHuruf = 0;
  _editprodukState(this._id, this._img,this._name,this._price,this._stock,this._deskripsi,this._kolek);
  final _formkey = GlobalKey<FormState>();
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    kategoriadmin(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Edit Produk'),
          backgroundColor: Colors.lightGreen,
          actions: [
              IconButton(
              onPressed: () {
                DatabaseServices.hapusproduk(_kolek,_id);
              },
              icon: Icon(Icons.delete))
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Produk Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Produk Image",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    myAlert(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.lightGreen,
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
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            
                            child: Image.network(
                              "${_img}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                ),
              ),
              Text("Produk Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputtName,
                  //onChanged: _onChangedHuruf,
                  decoration: InputDecoration(
                    counterText: '${_charHuruf}',
                    border: OutlineInputBorder(),
                    hintText: "${_name}",
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Nama tidak bisa kosong";
                    }
                    if (!RegExp("^[a-zA-Z].[a-z]").hasMatch(value)) {
                      return ("Masukan nama dengan benar");
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _onChangedHuruf(inputtName.text);
                  },
                ),
              ),
              Text("Produk Price",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputprice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "${_price}",
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Harap isi harga";
                    }
                    if (!RegExp("^[0-9]").hasMatch(value)) {
                      return ("Harap isi harga dengan benar");
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
              Text("Produk Stock",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputstock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "${_stock}",
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "Harap isi stock";
                    }
                    if (!RegExp("^[0-9]").hasMatch(value)) {
                      return ("Harap isi stock dengan benar");
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {},
                ),
              ),
              Text("Produk Deskripsi",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputdeskripsi,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "${_deskripsi}",
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "tidak bisa kosong";
                    }
                    else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                  },
                ),
              ),
              ElevatedButton(
                child: Text('edit data'),
                onPressed: () async {
                  editData();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                ),
              )
            ]),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.lightGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment),
      //       label: 'Pesanan',
      //       backgroundColor: Colors.lightGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications_sharp),
      //       label: 'Notif',
      //       backgroundColor: Colors.lightGreen,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profil',
      //       backgroundColor: Colors.lightGreen,
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color.fromARGB(255, 255, 255, 255),
      //   onTap: _onItemTapped,
      // ),
    );
  }

  void editData() {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()){
      itungan(inputtName.text.toLowerCase());
    //print(imageUrl);
    
    DatabaseServices.UpdateProduk(
      _kolek,
      _id,
      name: inputtName.text.toLowerCase(),
      img: imagePath ?? _img,
      price: int.parse(inputprice.text),
      stock: int.parse(inputstock.text),
      deskripsi: inputdeskripsi.text.toLowerCase(),
      search: search,
    );
    search.clear();
    }
    
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
