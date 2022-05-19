import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UbahProfil extends StatefulWidget {
  const UbahProfil({Key? key}) : super(key: key);

  @override
  State<UbahProfil> createState() => _UbahProfilState();
}

class _UbahProfilState extends State<UbahProfil> {
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
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Profil"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Column(
            children: [
              Container(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: image != null
                        ? ClipOval(
                            child: Image.file(
                            image!,
                            width: 81,
                            height: 81,
                            fit: BoxFit.cover,
                          ))
                        : SizedBox(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'images/default.png',
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      'Choose Profile Photo',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // ignore: deprecated_member_use
                                        FlatButton.icon(
                                          icon: Icon(Icons.camera),
                                          onPressed: () {
                                            openCamera();
                                            Navigator.pop(context);
                                          },
                                          label: Text('Camera'),
                                        ),
                                        // ignore: deprecated_member_use
                                        FlatButton.icon(
                                          icon: Icon(Icons.image),
                                          onPressed: () {
                                            openGallery();
                                            Navigator.pop(context);
                                          },
                                          label: Text('Gallery'),
                                        )
                                      ],
                                    )
                                  ],
                                ))));
                      },
                      child: Text(
                        "Edit Foto Profil",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Nama Lengkap"),
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Password"),
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(labelText: "No.Ponsel"),
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Alamat"),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: SizedBox(
                    width: 315,
                    height: 46,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Simpan"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen))),
              )
            ],
          )),
        ),
      ),
    );
  }
}
