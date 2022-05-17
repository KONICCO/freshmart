import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'kategori.dart';
import 'pagebuah1.dart';

class Buah extends StatefulWidget {
  const Buah({Key? key}) : super(key: key);

  @override
  _BuahState createState() => _BuahState();
}

class _BuahState extends State<Buah> {
  // This holds a list of fiction Item
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allItem = [
    {
      "id": 1,
      "name": "buah naga 1Kg ",
      "harga": "Rp15.000",
      "img":
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-5095900/kedaisayur_kedaisayur-buah-naga-buah-buahan--1-kg-_full07.jpg',
      // "page": '/Buah',
    },
    {
      "id": 2,
      "name": "buah kiwi 1Kg",
      "harga": "Rp15.000",
      "img":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLUCCJb0f_aLATYUaXOCPbUqsQ9n8YcU9C_w&usqp=CAU',
      // "page": '/buah',
    },
    {
      "id": 3,
      "name": "Apel 1 KG",
      "harga": "Rp15.000",
      "img":
          'https://id.sharp/sites/default/files/uploads/image-artikel/Jenis%20Buah-Buahan%20Ini%20Efektif%20Membantu%20Menurunkan%20Berat%20Badan%201.jpg',
      // "page": '/buah',
    },
    {
      "id": 4,
      "name": "Manggis",
      "harga": "Rp15.000",
      "img":
          'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2022/01/12085334/Apa-Saja-Manfaat-Mengonsumsi-Buah-Manggis_-01.jpg',
    },
    // {
    //   "id": 5,
    //   "name": "Sukuh",
    //   "img":
    //       "https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    // },
    // {
    //   "id": 6,
    //   "name": "Gedong Songo",
    //   "img":
    //       "https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    // },
    // {
    //   "id": 7,
    //   "name": "Cetho",
    //   "img":
    //       "https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    // },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundItem = [];

  int _selectedIndex = 0;

  @override
  initState() {
    // at the beginning, all Item are shown
    _foundItem = _allItem;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all Item
      results = _allItem;
    } else {
      results = _allItem
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundItem = results;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.message),
          ),
        ],
        title: Container(
          width: 300,
          height: 37,
          child: Center(
            child: TextField(
              onChanged: (value) => _runFilter(value),
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
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundItem.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                      itemCount: _foundItem.length,
                      itemBuilder: (context, index) => Container(
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
                                                      _foundItem[index]
                                                          ['img']))),
                                        ),
                                        Container(
                                            // color: Colors.lightGreen,
                                            width: 153,
                                            margin: const EdgeInsets.only(
                                              left: 15.0,
                                              bottom: 90.0,
                                            ),
                                            decoration: new BoxDecoration(
                                                color: Colors.lightGreen,
                                                borderRadius:
                                                    new BorderRadius.only(
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          10.0),
                                                  bottomRight:
                                                      const Radius.circular(
                                                          10.0),
                                                )),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 8, top: 8),
                                                  child: Text(
                                                    _foundItem[index]['name'],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  _foundItem[index]['harga'],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    ctx) {
                                                      return pagebuah1();
                                                    }));
                                                  },
                                                  //color: Colors.white,
                                                  child: Container(
                                                    color: Colors.white,
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    padding: const EdgeInsets
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
                    )
                  : const Text(
                      'tidak ditemukan',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.lightGreen),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifikasi',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.lightGreen,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
