
import 'package:bisa/notifikasi.dart';
import 'package:bisa/pagebuah1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  
                }),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  onPressed: () {
                   
                  },
                  icon: Icon(Icons.message))),
        ],
        title: Container(
          width: 300,
          height: 37,
          child: Center(
            child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(bottom: -10.0, left: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Cari buah, sayur, beras...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
          ? FirebaseFirestore.instance
              .collection("seacrhItems")
              .where("search", arrayContains: name)
              .snapshots()
          : FirebaseFirestore.instance.collection("seacrhItems").snapshots(),
        builder: (context, snapshot){
          return (snapshot.connectionState == ConnectionState.waiting)
            ? Center(child: CircularProgressIndicator())
            : 
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Wrap(
                                    spacing: 10.0,
                                    runSpacing: 20.0,
                                    children: [
                                      Container(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                data['page']);
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 2.5),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 153,
                                                  height: 115,
                                                  margin:
                                                      EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          new BorderRadius.only(
                                                        topLeft: const Radius
                                                            .circular(10.0),
                                                        topRight: const Radius
                                                            .circular(10.0),
                                                      ),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              data['img']))),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15.0),
                                                  width: 153,
                                                  height: 58,
                                                  decoration: new BoxDecoration(
                                                      color: Colors.lightGreen,
                                                      borderRadius:
                                                          new BorderRadius.only(
                                                        bottomLeft: const Radius
                                                            .circular(10.0),
                                                        bottomRight:
                                                            const Radius
                                                                .circular(10.0),
                                                      )),
                                                  child: Center(
                                                    child: Text(
                                                      data['name'],
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
              );
      
        }
      ),
      
    );
  }
}
