import 'dart:io';
import 'package:bisa/admin/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:bisa/admin/kategori/kategori.dart';
import 'package:bisa/profile/profile_screen.dart';

class tambahkategori extends StatefulWidget {
  tambahkategori({Key? key}) : super(key: key);

  @override
  State<tambahkategori> createState() => _tambahkategoriState();
}

class _tambahkategoriState extends State<tambahkategori> {
  final _formkey = GlobalKey<FormState>();
  final inputtName = new TextEditingController();
  final inputimg = new TextEditingController();
  final inputtid = new TextEditingController();
  List search = [];

  int _charHuruf = 0;

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
  List idkategori = [];
  Future<void> _onPressed() async {
    FirebaseFirestore.instance.collection("seacrhItems").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            idkategori.add(result.data());
            print(idkategori[0]['id']);
          });

          // print(result.data());
        });
      },
    );
  }


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onPressed();
  }

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add Kategori'),
          backgroundColor: Colors.lightGreen,
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
              ),
              Text("Kategori ID",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputtid,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "4 digit ID",
                  ),
                  validator: (value) {
                      // if (int.parse(inputtid.text) == idkategori[i]['id']){
                      //           return "Terdapat id yang sama";
                                
                      // }
                    
                    if(value!.isEmpty) {
                      return "Harap isi ID kategori";
                      }
                     if (!RegExp("^[0-9]").hasMatch(value)) {
                        return ("Masukan ID kategori");
                      } else {
                        return null;
                      }
                  },
                  onChanged: (value) {},
                ),
              ),
              Text("Kategori Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextFormField(
                  controller: inputtName,
                  onChanged: (value) {
                    _onChangedHuruf(inputtName.text);
                  },
                  decoration: InputDecoration(
                    counterText: '${_charHuruf}',
                    border: OutlineInputBorder(),
                    hintText: "Buah, Sayur",
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
                ),
              ),
              ElevatedButton(
                child: Text('add data'),
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
      DatabaseServices.createOrUpdateKategori(
          int.parse(inputtid.text),
          name: inputtName.text.toLowerCase(),
          img: imagePath ?? "https://media.istockphoto.com/vectors/vegetables-on-shopping-cart-trolley-grocery-logo-icon-design-vector-vector-id1205419959?k=20&m=1205419959&s=612x612&w=0&h=F4gyp5wuFkCaZr00OQS8KPCSE1_4pHmFiOIM2TQlOPI=",
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
