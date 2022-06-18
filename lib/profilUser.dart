import 'package:bisa/ubahProfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profilUser extends StatefulWidget {
  const profilUser({Key? key}) : super(key: key);

  @override
  State<profilUser> createState() => _profilUserState();
}

class _profilUserState extends State<profilUser> {
  List profil = [];
  User? _auth = FirebaseAuth.instance.currentUser;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');
  Future<void> getData() async {
    DocumentReference<Object?> querySnapshot =
        await _collectionRef.doc("${_auth!.uid}");
    final allData = querySnapshot.get().then(
      (value) {
        setState(() {
          profil.add(value.data());
          //print(profil[0]['uid']);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: [
          IconButton(
              onPressed: (() {
                //print(profil[0]['nama']);
                //pesanan.clear();
              }),
              icon: Icon(Icons.refresh))
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
          itemCount: profil.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage('${profil[index]['img']}')),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Nama lengkap"),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              width: 277,
                              height: 40,
                              color: Color(0xFFBCE191),
                              child: Center(
                                child: Text(
                                  "${profil[index]['nama']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Nomor"),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              width: 277,
                              height: 40,
                              color: Color(0xFFBCE191),
                              child: Center(
                                child: Text(
                                  "${profil[index]['nomor']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Email"),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              width: 277,
                              height: 40,
                              color: Color(0xFFBCE191),
                              child: Center(
                                child: Text(
                                  "${profil[index]['email']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Alamat"),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              width: 277,
                              height: 40,
                              color: Color(0xFFBCE191),
                              child: Center(
                                child: Text(
                                  "${profil[index]['alamat']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Password"),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              width: 277,
                              height: 40,
                              color: Color(0xFFBCE191),
                              child: Center(
                                child: Text(
                                  "budiganteng44",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: SizedBox(
                              width: 277,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.lightGreen),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext ctx) {
                                      return UbahProfil(uid: profil[index]['uid'], email: profil[index]['email'], nama: profil[index]['nama'], img: profil[index]['img'],alamat:profil[index]['alamat'],nomor: profil[index]['nomor'],wrool: profil[index]['wrool'], );
                                    }));
                                  },
                                  child: Text("Edit Profil"))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
