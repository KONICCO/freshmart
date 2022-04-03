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
          title: SizedBox(
              width: 260,
              height: 38,
              child: Center(
                  child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: -10.0, left: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Sayur, Buah dll',
                          suffixIcon: const Icon(Icons.search))))),
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
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
                                'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-5095900/kedaisayur_kedaisayur-buah-naga-buah-buahan--1-kg-_full07.jpg'))),
                  ),
                  Container(
                    color: Colors.white,
                    width: 500,
                    // margin: const EdgeInsets.only(left: 15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10 ,bottom: 8, top: 8),
                          child: 
                          const Text(
                            'Buah naga 1kg',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                            )
                          
                          ),
                      
                      Container(
                        margin: const EdgeInsets.only(right: 10,left: 10 ,bottom: 8, top: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Rp 25.000',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text(
                              'Stock: 10',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 7,
                        color: Color.fromARGB(255, 252, 252, 252)
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10,left: 10 ,bottom: 8, top: 13),
                        height: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Deskripsi Produk',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              'Consectetur labore esse minim enim pariatur occaecat dolor cupidatat labore magna nostrud in elit eu.',
                              style: TextStyle(color: Colors.black,  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ]
                    ),
                    
                  ),
                ],
              ),
            ),
            Container(
              child: Text('data')
            )
          ],
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
