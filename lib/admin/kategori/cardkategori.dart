import 'package:bisa/admin/produk/produk.dart';
import 'package:bisa/modul/menu.dart';
import 'package:flutter/material.dart';

class cardkategoriadmin extends StatelessWidget {
  final Menu menu;
  
  cardkategoriadmin(this.menu);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.all(10),
        child: Padding(
          padding:  EdgeInsets.only(top: 0.0),
          child: Row(
            children: [
              Wrap(spacing: 10.0, runSpacing: 20.0, children: [
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (Context) => produk(menu.img,menu.name)));
                    },
                    child: Container(
                      // margin: EdgeInsets.only(left: 2.5),
                      child: Column(
                        children: [
                          Container(
                            width: 153,
                            height: 115,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                  topLeft:  Radius.circular(10.0),
                                  topRight:  Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(menu.img))),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0),
                            width: 153,
                            height: 58,
                            decoration: new BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: new BorderRadius.only(
                                  bottomLeft:  Radius.circular(10.0),
                                  bottomRight:  Radius.circular(10.0),
                                )),
                            child: Center(
                              child: Text(
                                menu.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
