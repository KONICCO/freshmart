import 'package:bisa/kategori/kategori.dart';
import 'package:bisa/pesanan/detailPesanan.dart';
import 'package:bisa/pesanan/pesananUser.dart';
import 'package:flutter/material.dart';

class cardPesanan extends StatelessWidget {
  final pesananUser pesanan;

  cardPesanan(this.pesanan);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (Context) => detailPesanan(pesanan.namakantong)));
        },
        child: Container(
          height: 70,
          width: 336,
          color: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("${pesanan.namakantong}",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      )),
    );
  }
}
