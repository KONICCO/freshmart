import 'package:flutter/material.dart';
import 'buah.dart';

// void main() {
//   runApp(new MyApp());
// }

class kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.message),
            ),
          ],
          title: Container(
            width: 300,
            height: 37,
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.only(bottom: -10.0, left: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Cari buah, sayur, beras...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          decoration:
              BoxDecoration(image: DecorationImage(image: NetworkImage(""))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Wrap(
                  spacing: 15.0,
                  runSpacing: 30.0,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 2.5),
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Buah',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1538159021332-8f28e9eca2fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Sayur',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Daging',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1586201375761-83865001e31c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Beras',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://awsimages.detik.net.id/community/media/visual/2022/01/20/jenis-minyak-goreng-yang-berbahaya_169.jpeg?w=1200'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Minyak',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return buah();
                          }));
                          ;
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 115,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://statik.tempo.co/data/2019/11/07/id_887176/887176_720.jpg'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                color: Colors.lightGreen,
                                width: 153,
                                height: 58,
                                child: Center(
                                  child: Text(
                                    'Telur',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                label: 'Pengiriman',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Akun',
              ),
            ],
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
