import 'package:bisa/admin/pendapatan/modulPendapatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class cardPendapatan extends StatefulWidget {
  final modulPendapatan pendapatan;
  cardPendapatan(this.pendapatan, {Key? key}) : super(key: key);
  @override
  State<cardPendapatan> createState() => _cardPendapatanState(pendapatan);
}

class _cardPendapatanState extends State<cardPendapatan> {
  final modulPendapatan _pendapatan;
  _cardPendapatanState(this._pendapatan);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (Context) => detailPesanan(pesanan.namakantong)));
        },
        child: Container(
          height: 90,
          width: 336,
          color: Colors.lightGreen,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kantong: ${_pendapatan.namakantong}",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("Alamat: ${_pendapatan.alamat}",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Text("Pemilik: ${_pendapatan.namalengkap}",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ])),
        ),
      )),
    );
  }
}
