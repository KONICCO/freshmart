import 'package:bisa/admin/pesanan/detailPesanan.dart';
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
          height: 90,
          width: 336,
          color: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Text("Kantong: ${pesanan.namakantong}",
                style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("Alamat: ${pesanan.alamat}",
                style: TextStyle(color: Colors.white, fontSize: 15)),
                Text("Pemilik: ${pesanan.namalengkap}",
                style: TextStyle(color: Colors.white, fontSize: 15)),
              ]
            )
            
            
          ),
          
        ),
      )),
    );
  }
}
