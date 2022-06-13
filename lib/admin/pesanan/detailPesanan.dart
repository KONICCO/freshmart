import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class detailPesanan extends StatefulWidget {
  String namakantong;
  detailPesanan(this.namakantong, {Key? key}) : super(key: key);

  @override
  State<detailPesanan> createState() => _detailPesananState(namakantong);
}

class _detailPesananState extends State<detailPesanan> {
  String _namakantong;
  _detailPesananState(this._namakantong);
  List pesanan = [];
  User? auth = FirebaseAuth.instance.currentUser;

  // final _auth = FirebaseAuth.instance;
  Future<void> _onPressed() async {
    FirebaseFirestore.instance.collection(_namakantong).get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            pesanan.add(result.data());
          });

          // print(result.data());
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onPressed();
    //initialize();
    // setTotal();
    //getproduk();
    //print(snap);
    //print(pesanan);
  }

  num total = 0;
  setTotal(pesanan) {
    num initTotal = 0;
    for (var i = 0; i < pesanan.length; i++) {
      initTotal = initTotal + (pesanan[i]['price'] * pesanan[i]['jumlahbeli']);
    }
    total = initTotal;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: pesanan.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.network('${pesanan[index]['img']}'),
                    ),
                    title: Text(pesanan[index]['name']),
                    subtitle: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${pesanan[index]['jumlahbeli']}'),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(
                              pesanan[index]['price'],
                            ),
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ],
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 90,
        width: double.infinity,
        color: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ringkasan Belanja",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Harga"),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(
                    setTotal(pesanan),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ongkos Kirim"),
                Text("Rp5.000"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(
                    setTotal(pesanan) + 5000,
                  ),
                  style: TextStyle(fontSize: 25),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
