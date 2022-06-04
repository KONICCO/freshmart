import 'package:bisa/cart/detailcart.dart';
import 'package:bisa/profile/components/body.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_cart),
            Text('Keranjangku'),
          ],
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                detailcart(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    '\Rp 10.000-,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              Container(
                width: 120,
                height: 70,
                color: Colors.lightGreen,
                child: Center(
                    child: Text(
                  'Check Out',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
