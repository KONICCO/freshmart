import 'package:flutter/material.dart';

class profilUser extends StatefulWidget {
  const profilUser({Key? key}) : super(key: key);

  @override
  State<profilUser> createState() => _profilUserState();
}

class _profilUserState extends State<profilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'images/default.png',
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Nama Lengkap"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        width: 277,
                        height: 40,
                        color: Color(0xFFBCE191),
                        child: Center(
                          child: Text(
                            "Budi Gunawan",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Nomor Telepon"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        width: 277,
                        height: 40,
                        color: Color(0xFFBCE191),
                        child: Center(
                          child: Text(
                            "081234232134",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Email"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        width: 277,
                        height: 40,
                        color: Color(0xFFBCE191),
                        child: Center(
                          child: Text(
                            "Budi@gmail.com",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Alamat"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        width: 277,
                        height: 40,
                        color: Color(0xFFBCE191),
                        child: Center(
                          child: Text(
                            "Jakarta, Jln Perjuangan No.45",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Password"),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                            onPressed: () {},
                            child: Text("Edit Profil"))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
