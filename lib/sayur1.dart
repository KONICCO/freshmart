//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'kategori/kategori.dart';

// void main() {
//   runApp(new MyApp());
// }
class sayur1 extends StatefulWidget {
  sayur1({Key? key}) : super(key: key);

  @override
  State<sayur1> createState() => _sayur1State();
}

class _sayur1State extends State<sayur1> {
  int i = 1;
  void _minus() {
    if (i > 1) {
      setState(() {
        i--;
      });
    }
  }

  void _plus() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 500,
                    height: 300,
                    // margin: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(25),
                        //   topRight: Radius.circular(25),
                        // ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://unsplash.com/photos/TvQ4QnIcj1w'))),
                  ),
                  Container(
                    color: Colors.white,
                    width: 500,
                    // margin: const EdgeInsets.only(left: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 10, bottom: 8, top: 8),
                              child: const Text(
                                'Tomat 1kg',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 8, top: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Rp 16.000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Text(
                                  'Stock: 10',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 7,
                              color: Color.fromARGB(255, 252, 252, 252)),
                          Container(
                            margin:
                                EdgeInsets.only(right: 10, left: 10, top: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi Produk',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Consectetur labore esse minim enim pariatur occaecat dolor cupidatat labore magna nostrud in elit eu.',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: _minus,
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '${i}',
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: _plus,
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // margin:  EdgeInsets.only(left: 100, bottom: 80),
                  height: 40,
                  width: 200.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // minimumSize: Size(50, 40), //////// HERE
                    ),
                    onPressed: () {},
                    child: Text('+ Keranjang'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
