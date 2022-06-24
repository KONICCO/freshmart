import 'dart:io';
import 'package:bisa/databaseservices.dart';
import 'package:bisa/login_screen.dart';
import 'package:bisa/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UbahProfil extends StatefulWidget {
  String uid;
  String nama;
  String alamat;
  String nomor;
  String wrool;
  String email;
  String img;
  UbahProfil(
      {Key? key,
      required this.alamat,
      required this.email,
      required this.nama,
      required this.nomor,
      required this.uid,
      required this.wrool,
      required this.img})
      : super(key: key);

  @override
  State<UbahProfil> createState() =>
      _UbahProfilState(uid, nama, alamat, nomor, wrool, email, img);
}

class _UbahProfilState extends State<UbahProfil> {
  String _uid;
  String _nama;
  String _alamat;
  String _nomor;
  String _wrool;
  String _email;
  String _img;
  _UbahProfilState(this._uid, this._nama, this._alamat, this._nomor,
      this._wrool, this._email, this._img);
  final _formkey = GlobalKey<FormState>();

  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController nomorTextEditingController;
  late TextEditingController alamatTextEditingController;
  TextEditingController passTextEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameTextEditingController = new TextEditingController(text: _nama);
    emailTextEditingController = new TextEditingController(text: _email);
    nomorTextEditingController = new TextEditingController(text: _nomor);
    alamatTextEditingController = new TextEditingController(text: _alamat);
  }

  User? firebase = FirebaseAuth.instance.currentUser;
  Future<UserCredential> reauthenticate(currentPassword) {
    AuthCredential cred = EmailAuthProvider.credential(
      email: _email,
      password: currentPassword,
    );
    return firebase!.reauthenticateWithCredential(cred);
  }

  //FirebaseAuth firebase = FirebaseAuth.instance;
  void changeEmail(
      uid, nama, wrool, email, nomor, alamat, currentPassword, newEmail) {
    reauthenticate(currentPassword)
        .then((value) => {
              firebase!
                  .updateEmail(newEmail)
                  .then((value) => {
                        print('Update email'),
                        DatabaseServices.Updateprofil(
                          uid,
                          name: nama,
                          img: imagePath ?? _img,
                          wrool: wrool,
                          email: email,
                          nomor: nomor,
                          alamat: alamat,
                        ),
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        )
                      })
                  .catchError((Error) => {print(Error)})
            })
        .catchError((error) => {print(error)});
    // .then(() => {
    //   var user = FirebaseAuth.instance.currentUser;

    //   user.updateEmail(newEmail).then(() => {
    //     console.log("Email updated!");
    //   }).catch((error) => { console.log(error); });
    // })
    // .catch((error) => { console.log(error); });
  }

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Profil"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
              child: Column(
            children: [
              Container(
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
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
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 15),
                    child: TextButton(
                      onPressed: () {
                        myAlert(context);
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
                padding: EdgeInsets.only(right: 10, left: 10, top: 15),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      Container(
                        child: TextFormField(
                          controller: nameTextEditingController,
                          decoration:
                              InputDecoration(labelText: "Nama Lengkap"),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "name cannot be empty";
                            }
                            if (!RegExp("^[a-zA-Z].[a-z]").hasMatch(value)) {
                              return ("Masukan nama lengkap anda");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: nomorTextEditingController,
                          decoration: InputDecoration(labelText: "No.Ponsel"),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Isi nomor telepon anda";
                            }
                            if (!RegExp("^[0-9]").hasMatch(value)) {
                              return ("Please enter a valid number");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(labelText: "Email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email Tidak boleh kosong";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: alamatTextEditingController,
                          decoration: InputDecoration(labelText: "Alamat"),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "name cannot be empty";
                            }
                            if (!RegExp("^[a-zA-Z].[a-z]").hasMatch(value)) {
                              return ("Masukan nama lengkap anda");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200),
                child: SizedBox(
                    width: 315,
                    height: 46,
                    child: ElevatedButton(
                        onPressed: () {
                          ubah(context);

                          //Navigator.pop(context);
                        },
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

  void signUp(String uid, String nama, String email, String password,
      String nomor, String alamat, String wrool) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      changeEmail(uid, nama, email, wrool, nomor, alamat, password, email);

      // .then((value) => {
      //   logout()
      // });

    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
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

  void ubah(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(child: Text('Ingin merubah profile anda?')),
          content: Form(
            key: _formkey,
            child: Container(
              height: MediaQuery.of(context).size.height / 4.5,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      controller: passTextEditingController,
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (!regex.hasMatch(value)) {
                          return ("please enter valid password min. 6 character");
                        }
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text('Batal'),
                        style: ElevatedButton.styleFrom(primary: Colors.red
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 50, vertical: 20),
                            // textStyle: TextStyle(
                            //     fontSize: 30, fontWeight: FontWeight.bold)
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          signUp(
                            _uid,
                            nameTextEditingController.text,
                            emailTextEditingController.text,
                            passTextEditingController.text,
                            nomorTextEditingController.text,
                            alamatTextEditingController.text,
                            _wrool,
                          );
                        },
                        child: Text('Ok'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 50, vertical: 20),
                            // textStyle: TextStyle(
                            //     fontSize: 30, fontWeight: FontWeight.bold)
                            ),
                      ),
                    ],
                  )

                  // Text(
                  //   'Maaf tidak ada refund setelah membeli',
                  //   style: TextStyle(color: Colors.red),
                  // )
                ],
              ),
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
