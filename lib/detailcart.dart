import 'package:flutter/material.dart';

class detailcart extends StatefulWidget {
  detailcart({Key? key}) : super(key: key);

  @override
  State<detailcart> createState() => _detailcartState();
}

class _detailcartState extends State<detailcart> {
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
                Image(
                    image: NetworkImage(
                        'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-5095900/kedaisayur_kedaisayur-buah-naga-buah-buahan--1-kg-_full07.jpg')),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Buah naga', style: TextStyle(fontSize: 16.0)),
                        SizedBox(height: 3),
                        Text('10.000', style: TextStyle(fontSize: 16.0)),
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
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0),
                                  ),
                                  InkWell(
                                    onTap: () {},
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
                                  left: 130, right: 10.0, top: 7.0, bottom: 5.0),
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
}
