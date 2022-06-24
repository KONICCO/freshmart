import 'package:bisa/kategori/kategori.dart';
import 'package:bisa/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  final List<Map<String, dynamic>> _allItem = [
    {
      "id": 1,
      "text": "buah",
      "img":
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      // "page": '/buah',
    },
    {
      "id": 2,
      "text": "sayur",
      "img": 'https://oretzz.com/wp-content/uploads/2020/10/sayur-sayuran.jpg',
      // "page": '/buah',
    },
    {
      "id": 3,
      "text": "Daging",
      "img": 'https://data2.1freewallpapers.com/download/meat-herbs-chop.jpg',
      // "page": '/buah',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('Pesanan anda sedang dalam perjalanan!'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}