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
              child: Icon(Icons.shopping_cart_checkout),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.chat_bubble_rounded),
            ),
          ],
          title: Container(
            width: 300,
            height: 37,
            // alignment:,
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 15.0,
                runSpacing: 30.0,
                children: [
                  InkWell(
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
                          Image.network(
                            "https://images.unsplash.com/photo-1609780447631-05b93e5a88ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                            width: 163,
                            height: 118,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Buah',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('ini inkwell');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1488459716781-31db52582fe9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            width: 163,
                            height: 117,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Sayur',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('ini inkwell');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bWVhdHxlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60",
                            width: 163,
                            height: 117,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Daging',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('ini inkwell');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1586201375761-83865001e31c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            width: 163,
                            height: 117,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Beras',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('ini inkwell');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            "https://pict.sindonews.net/dyn/850/pena/news/2022/01/31/34/672513/minyak-goreng-langka-di-pasaran-produsen-akhirnya-angkat-bicara-trn.jpg",
                            width: 163,
                            height: 117,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Minyak',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('ini inkwell');
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1609780447631-05b93e5a88ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                            width: 163,
                            height: 117,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Buah',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.lightGreen,
                      width: 163,
                      height: 173,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
