import 'package:flutter/material.dart';
import 'buah.dart';
import 'sayur.dart';
import 'profile/profile_screen.dart';
import 'main.dart';
import 'profile/profile_screen.dart';
import 'chat/screens/chatscreen.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  final List<Map<String, dynamic>> _allItem = [
    {
      "id": 1,
      "name": "buah",
      "img":
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      "page": '/buah',
    },
    {
      "id": 2,
      "name": "sayur",
      "img":
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.popbela.com%2Fcareer%2Finspiration%2Faisyah-banowati%2Faplikasi-belanja-sayur-dan-buah-online&psig=AOvVaw30BylohjLLNhKxFQycn5OG&ust=1653037297041000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLjW5IKa6_cCFQAAAAAdAAAAABAD',
      "page": '/sayur',
    },
    {
      "id": 3,
      "name": "Daging",
      "img": 'https://data2.1freewallpapers.com/download/meat-herbs-chop.jpg',
      "page": '/buah',
    },
  ];

  List<Map<String, dynamic>> _foundItem = [];

  int _selectedIndex = 0;

  @override
  initState() {
    _foundItem = _allItem;
    super.initState();
  }

  // Method pengecekan box pencarian
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allItem;
    } else {
      results = _allItem
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // Mengubah segala inputan menjadi lowercase
    }

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
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => chatscreen()),
                    );
                  },
                  icon: Icon(Icons.message))),
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
                          crossAxisCount: 2),
                      itemCount: _foundItem.length,
                      itemBuilder: (context, index) => Container(
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
                                                _foundItem[index]['page']);
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
                                                              _foundItem[index]
                                                                  ['img']))),
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
                                                      _foundItem[index]['name'],
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
        items: <BottomNavigationBarItem>[
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
            icon: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext ctx) {
                    return ProfileScreen();
                  }));
                }),
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
