import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.store),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {print("");},
            ),
          ],
          leading: Container(
            child: Icon(Icons.arrow_back),
          ),
          title: Container(
              width: 200,
              height: 37,
              child: Center(
                  child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: -10.0, left: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Sayur, Buah dll',
                          suffixIcon: Icon(Icons.search))))),
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 30,
              children: [
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(25),
                          //   topRight: Radius.circular(25),
                          // ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-5095900/kedaisayur_kedaisayur-buah-naga-buah-buahan--1-kg-_full07.jpg'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      margin: EdgeInsets.only(left: 15),
                      
                      
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'buah naga 1kg',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 25.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),
                //=====================
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLUCCJb0f_aLATYUaXOCPbUqsQ9n8YcU9C_w&usqp=CAU'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'kiwi 1kg',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 15.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://id.sharp/sites/default/files/uploads/image-artikel/Jenis%20Buah-Buahan%20Ini%20Efektif%20Membantu%20Menurunkan%20Berat%20Badan%201.jpg'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      margin: EdgeInsets.only(left: 15),
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'apel 1kg',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 8.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),
                //=====================
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/01/12085334/Apa-Saja-Manfaat-Mengonsumsi-Buah-Manggis_-01.jpg'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'Manggis 1kg',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 12.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),

                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://foto.kontan.co.id/pZ6yQDMf6vpr2gfBDh2BVlG_mnM=/smart/2021/04/30/1168859913p.jpg'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      margin: EdgeInsets.only(left: 15),
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'sirsak 1 buah',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 10.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),
                //=====================
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 153,
                      height: 153,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://asset-a.grid.id/crop/0x40:626x416/700x465/photo/2020/06/03/226902286.jpg'))),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: 153,
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Text(
                              'Pisang 1kg',
                              style: TextStyle(color: Colors.white),
                            )),
                        Text(
                          'Rp. 10.000',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {},
                          //color: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3),
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
