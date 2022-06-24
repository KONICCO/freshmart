import 'package:bisa/admin/chats/chatdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class chatlog extends StatefulWidget {
  chatlog({Key? key}) : super(key: key);

  @override
  State<chatlog> createState() => _chatlogState();
}

class _chatlogState extends State<chatlog> {
  List user = [];
   
  Future<void> getData() async {
         FirebaseFirestore.instance.collection("users").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            user.add(result.data());
            print(user);
          });

          // print(result.data());
        });
      },
    );
    //print(allData);
  }
  @override
  void initState() {
    super.initState();
    //initialize()
    //getproduk();
    getData();
    //print(snap);
    //print(pesanan);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                print(user[0]['uid']);
                //pesanan.clear();
                setState(() {
                });
              }),
              icon: Icon(Icons.refresh))
        ],
        title: Row(
          children: [
            
            Text('Chats'),
          ],
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 10,
              top: 5,
              right: 10,
              bottom: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 5, blurRadius: 5)
                ]),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(user[index]['img'])),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "${user[index]['nama']}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Nomor: ${user[index]['nomor']}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Alamat: ${user[index]['alamat']}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      MaterialButton(
                        height: 30,
                        color: Colors.lightGreen,
                        textColor: Colors.white,
                        child: Text('Chats'),
                        onPressed: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return ChatDetail(friendName: user[index]['nama'], friendUid: user[index]['uid']);
                          }));
                          setState(() {
                            print(user[index]['nama']);
                          });
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (BuildContext ctx) {
                          //   return keranjangdetail(
                          //     iduser: profil[0]['uid'],
                          //     detail: index,
                          //     data: pesanan,
                          //   );
                          // }));
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}