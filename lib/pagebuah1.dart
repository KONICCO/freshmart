//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'kategori.dart';

// void main() {
//   runApp(new MyApp());
// }

class pagebuah1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            
          ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        title: Container(
              width: 260,
              height: 38,
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
              
                //=====================
                
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifisikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
