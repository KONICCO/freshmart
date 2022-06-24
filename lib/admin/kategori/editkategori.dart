import 'dart:io';
import 'package:bisa/admin/database_services.dart';
import 'package:bisa/produk/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:bisa/admin/kategori/kategori.dart';
import 'package:bisa/profile/profile_screen.dart';

class editkategori extends StatefulWidget {
  String img;
  String name;
  int id;
  editkategori(this.id,this.img, this.name, {Key? key}) : super(key: key);

  @override
  State<editkategori> createState() => _editkategoriState(id,img,name);
}

class _editkategoriState extends State<editkategori> {
  String _img;
  String _name;
  int _id;
  
  final inputtName = new TextEditingController();
  final inputimg = new TextEditingController();
  List search = [];

  int _charHuruf = 0;
  _editkategoriState(this._id,this._img, this._name);
  
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
          title: Text('Edit Kategori'),
          backgroundColor: Colors.lightGreen,
          actions: [
              IconButton(
              onPressed: () {
                DatabaseServices.hapuskategori(_id);
                Navigator.pop(context);
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
                "Kategori Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Kategori Image",
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
              Text("Kategori Name: ${_name}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputtName,
                  //onChanged: _onChangedHuruf,
                  decoration: InputDecoration(
                    counterText: '${_charHuruf}',
                    border: OutlineInputBorder(),
                    hintText: "masukan nama untuk mengubah",
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
              ElevatedButton(
                child: Text('Edit data'),
                onPressed: () async {
                  addData();
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

  void addData() async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      itungan(inputtName.text.toLowerCase());
    //print(imageUrl);
    DatabaseServices.editKategori(
        _id,
        name: inputtName.text.toLowerCase(),
        img: imagePath ?? _img,
        search: search);
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
                    Navigator.pop(context);
                    setState(() {});
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
                    Navigator.pop(context);
                    setState(() {});
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
