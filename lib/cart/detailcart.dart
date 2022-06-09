import 'package:bisa/cart/cart.dart';
import 'package:bisa/cart/cartmodel.dart';
import 'package:bisa/kategori/cartuser.dart';
import 'package:flutter/material.dart';
import 'databasecart.dart';
import 'package:intl/intl.dart';
class detailcart extends StatefulWidget {
  final Cart cart;
  detailcart(this.cart);

  @override
  State<detailcart> createState() => _detailcartState(cart);
}

class _detailcartState extends State<detailcart> {
  final Cart _cart;
  
  _detailcartState(this._cart);

  var i;
  void _minus() {
    if (i > 1) {
      int i = _cart.jumlahbeli--;
    }
  }

  void _plus() {
    setState(() async {
      int i = _cart.jumlahbeli++;
    });
  }

  // void tampil(String name) {
  //   var text = name;
  // }
  int text = 1;
  final inputtJumlah = new TextEditingController();
  // int text = _cart.jumlahbeli;

  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Container(
        height: 110.0,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 1),
          ],
        ),
        child: ListTile(
          dense: true,
          contentPadding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(image: NetworkImage('${_cart.img}')),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_cart.name}', style: TextStyle(fontSize: 16.0)),
                        SizedBox(height: 3),
                        Text(NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(
                        _cart.price,
                      ),
                            style: TextStyle(fontSize: 16.0)),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              margin: EdgeInsets.only(top: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // InkWell(
                                  //   onTap: ()  async {

                                  //   },
                                  //   child: Icon(
                                  //     Icons.remove,
                                  //     color: Colors.green,
                                  //     size: 22,
                                  //   ),
                                  // ),
                                  Text(
                                   '${_cart.jumlahbeli}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                  ),
                                  InkWell(
                                    onTap: () {
                                     myAlert(context);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              padding: EdgeInsets.only(
                                  left: 70, right: 10.0, top: 7.0, bottom: 5.0),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: Colors.red),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.red, spreadRadius: 1),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void myAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Masukan Jumlah Beli'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: inputtJumlah,
                ),
                ElevatedButton(
                  onPressed: () async {
                    databasecart.updatecart(
                      _cart.userid,
                      _cart.id,
                      name: _cart.name,
                      img: _cart.img,
                      price: _cart.price,
                      jumlahbeli: int.parse(inputtJumlah.text),
                    );
                    setState(() {});
                    Navigator.pop(context);
                    super.initState();
                  },
                  child: Row(
                    children: <Widget>[
                      
                      Text('Ubah jumlah'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
}
