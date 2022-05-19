import 'package:bisa/detailcart.dart';
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
      
    );
    
  }
}