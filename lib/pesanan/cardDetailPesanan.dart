import 'package:bisa/pesanan/modulDetail.dart';
import 'package:flutter/material.dart';

class cardDetailPesanan extends StatefulWidget {
  final detail detailPesanan;
  const cardDetailPesanan(this.detailPesanan, {Key? key}) : super(key: key);

  @override
  State<cardDetailPesanan> createState() =>
      _cardDetailPesananState(detailPesanan);
}

class _cardDetailPesananState extends State<cardDetailPesanan> {
  final detail _detailPesanan;
  _cardDetailPesananState(this._detailPesanan);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FlutterLogo(),
          title: Text(_detailPesanan.name),
          subtitle: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_detailPesanan.jumlahbeli}'),
                Text(
                  '${_detailPesanan.harga}',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
          isThreeLine: true,
        ),
      ],
    );
  }
}
