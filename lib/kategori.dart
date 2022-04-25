import 'package:flutter/material.dart';
import 'buah.dart';
import 'profile/profile_screen.dart';
import 'main.dart';
import 'profile/profile_screen.dart';
import 'chat/screens/home_screen.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
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
      "img": 'https://oretzz.com/wp-content/uploads/2020/10/sayur-sayuran.jpg',
      "page": '/buah',
    },
    {
      "id": 3,
      "name": "Daging",
      "img": 'https://data2.1freewallpapers.com/download/meat-herbs-chop.jpg',
      "page": '/buah',
    },
    // {
    //   "id": 4,
    //   "name": "Arca Gupolo",
    //   "img":
    //       "https://images.unsplash.com/photo-1619566636858-adf3ef46400b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    // },
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
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //     );
            //   }
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
                          crossAxisCount: 2),
                      itemCount: _foundUsers.length,
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
                                                _foundUsers[index]['page']);
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
                                                              _foundUsers[index]
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
                                                      _foundUsers[index]
                                                          ['name'],
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
