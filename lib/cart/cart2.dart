import 'package:bisa/admin/database_services.dart';
import 'package:flutter/material.dart';
import 'databasecart.dart';
class keranjangdetail extends StatefulWidget {
  final String iduser;
  final int detail;
  final List data;
  keranjangdetail({Key? key, required this.detail, required this.data, required this.iduser}) : super(key: key);
  
  @override
  State<keranjangdetail> createState() => _keranjangdetailState(detail,data,iduser);
}

class _keranjangdetailState extends State<keranjangdetail> {
  final String _iduser;
  final int _detail;
  final List _data;
  _keranjangdetailState(this._detail, this._data,this._iduser);


  void setJumlah(_data, _detail, operasi){
    if (operasi == true){
      _data[_detail]['jumlahbeli'] = _data[_detail]['jumlahbeli'] + 1 ;
      setState((){
        databasecart.updatecart(
                      _iduser,
                      _data[_detail]['id'],
                      name: _data[_detail]['name'],
                      img: _data[_detail]['img'],
                      price: _data[_detail]['price'],
                      jumlahbeli: _data[_detail]['jumlahbeli'],
                    );
      });
    }else{
      _data[_detail]['jumlahbeli'] = _data[_detail]['jumlahbeli'] - 1 ;
      setState(() {
        databasecart.updatecart(
                      _iduser,
                      _data[_detail]['id'],
                      name: _data[_detail]['name'],
                      img: _data[_detail]['img'],
                      price: _data[_detail]['price'],
                      jumlahbeli: _data[_detail]['jumlahbeli'],
                    );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Produk"),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
              onPressed: (() async {
                await databasecart.hapuscart(_iduser,_data[_detail]['id']);
                //print(profil[0]['uid']);
                //pesanan.clear();
                
              }),
              icon: Icon(Icons.delete))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage("${_data[_detail]['img']}")
                ),
                borderRadius: BorderRadius.circular(10),
                ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "${_data[_detail]['name']}",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Rp"+"${_data[_detail]['price']}".toString(),
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Jumlah beli:",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            height: 30,
                            minWidth: 30,
                            color: Colors.lightGreen,
                            textColor: Colors.white,
                            child: Icon(Icons.remove),
                            onPressed: (){
                              if (!( _data[_detail]['jumlahbeli']<=0)){
                                print(_data[_detail]['jumlahbeli']);
                                setState(() {
                                setJumlah(_data, _detail,false);
                              });
                              }
                            }
                              
                            
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            child: Center(child: Text("${_data[_detail]['jumlahbeli']}")),
                          ),
                          MaterialButton(
                            height: 30,
                            minWidth: 40,
                            color: Colors.lightGreen,
                            textColor: Colors.white,
                            child: Icon(Icons.add),
                            onPressed: (){
                              print(_data[_detail]['jumlahbeli']);
                              setState(() {
                                setJumlah(_data, _detail,true);
                              });
                            }
                              
                            
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
