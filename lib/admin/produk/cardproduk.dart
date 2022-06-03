import 'package:flutter/material.dart';
import 'menuproduk.dart';
import 'package:intl/intl.dart';
class cardproduk extends StatelessWidget {
  final Menuproduk menu;
  cardproduk(this.menu);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
              child: Row(
                children: [
                  Wrap(spacing: 10.0,
                      // runSpacing: 20.0,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 2.5),
                          child: Column(
                            children: [
                              Container(
                                width: 153,
                                height: 95,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            menu.img))),
                              ),
                              Container(
                                  // color: Colors.lightGreen,
                                  width: 153,
                                  margin: EdgeInsets.only(
                                    left: 15.0,
                                    bottom: 90.0,
                                  ),
                                  decoration: new BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius:
                                          new BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(
                                                10.0),
                                        bottomRight:
                                            Radius.circular(
                                                10.0),
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 8, top: 8),
                                        child: Text(
                                          '${menu.name}',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                   locale: 'id', 
                                   symbol: 'Rp ',
                                   decimalDigits:0)
                                   .format(menu.price,
                                   ),
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder:
                                          //             (BuildContext
                                          //                 ctx) {
                                          //   return pageproduk1(menu.id,menu.img,menu.name,menu.price,menu.stock,menu.deskripsi);
                                          // }));
                                        },
                                        //color: Colors.white,
                                        child: Container(
                                          color: Colors.white,
                                          margin: EdgeInsets
                                              .symmetric(vertical: 8),
                                          padding: EdgeInsets
                                                  .symmetric(
                                              horizontal: 25,
                                              vertical: 3),
                                          child: Text(
                                            'Beli',
                                            style: TextStyle(
                                                color:
                                                    Colors.redAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ])
                ],
              ),
            ),
    );
  }
}