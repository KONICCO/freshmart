import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'kategori/kategori.dart';
import 'sayur1.dart';

class Sayur extends StatefulWidget {
  const Sayur({Key? key}) : super(key: key);

  @override
  _SayurState createState() => _SayurState();
}

class _SayurState extends State<Sayur> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Tomat 1Kg ",
      "harga": "Rp16.000",
      "img": 'https://unsplash.com/photos/TvQ4QnIcj1w',
    },
    {
      "id": 2,
      "name": "Selada 1Kg",
      "harga": "Rp15.000",
      "img": 'https://unsplash.com/photos/6_SGrUywWOQ',
    },
    {
      "id": 3,
      "name": "Timun 1 KG",
      "harga": "Rp15.000",
      "img": 'https://unsplash.com/photos/hCJZwPFlk4E',
    },
    {
      "id": 4,
      "name": "Kubis",
      "harga": "Rp15.000",
      "img":
          'https://www.istockphoto.com/photo/fresh-green-pointed-cabbage-wooden-background-top-view-gm1295926406-389496442?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_bottom&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fcabbage&utm_term=cabbage%3A%3Asearch-explore-top-affiliate-outside-feed-x-v2%3Ab',
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  int _selectedIndex = 0;

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
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
              child: _foundUsers.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                      itemCount: _foundUsers.length,
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
                                                      _foundUsers[index]
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
                                                    _foundUsers[index]['name'],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]['harga'],
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
                                                      return sayur1();
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
