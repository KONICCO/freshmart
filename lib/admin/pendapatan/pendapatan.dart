import 'package:bisa/admin/pendapatan/cardpendapatan.dart';
import 'package:bisa/admin/pendapatan/modulPendapatan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class pendapatan extends StatefulWidget {
  pendapatan({Key? key}) : super(key: key);

  @override
  State<pendapatan> createState() => _pendapatanState();
}

class _pendapatanState extends State<pendapatan> {
  DateTime selectedDate = DateTime(2022, 1, 1);
  List _dropdownMenuItems = ['One', 'Two', 'Free', 'Four'];
  List kantong = [];

  num total = 0;
  setTotal(kantong) {
    num initTotal = 0;
    for (var i = 0; i < kantong.length; i++) {
      initTotal = initTotal + (int.parse(kantong[i]['total']));
    }
    total = initTotal;
    return total;
  }

  @override
  void initState() {
    super.initState();
    // _onPressed();
  }

  // String selectedDate = '';
  _selectMonth(BuildContext context) async {
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate,
      locale: Locale("id"),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
          kantong.clear();
          _onPressed(selectedDate);
        });
      }
    });
  }

  Future<void> _onPressed(tanggal) async {
    FirebaseFirestore.instance
        .collection("kantong")
        .where("tanggal".toLowerCase(), isEqualTo: "${tanggal}".split(' ')[0])
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          setState(() {
            kantong.add(result.data());
          });

          // print(result.data());
        });
      },
    );
  }

  List totalPendapatan = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Row(
      //       mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: <Widget>[
      //   DropdownButton(
      //     value: _selectedItem,
      //     items: _dropdownMenuItems,
      //     underline: SizedBox(height: 0,),
      //     //underline: SizedBox(),
      //     onChanged: onChangeDropdownItem,
      //   ),
      //  ],
      //     ),
      //     backgroundColor: Colors.lightGreen,

      //     ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                print(kantong);
              }),
              icon: Icon(Icons.refresh))
        ],
        title: Row(
          children: [
            Text("Pendapatan"),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () => {
                _selectMonth(context),
                print(selectedDate.day + selectedDate.month + selectedDate.year)
              },
              child: Text('Pilih Tanggal'),
            )
          ],
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("kantong")
              .where("tanggal".toLowerCase(),
                  isEqualTo: "${selectedDate}".split(' ')[0])
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      totalPendapatan.add(data['total']);
                      return cardPendapatan(modulPendapatan(
                          namakantong: data['namakantong'],
                          namalengkap: data["namalengkap"],
                          alamat: data["alamat"]));
                    });
          }),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 70,
        width: double.infinity,
        color: Color.fromARGB(255, 50, 104, 241),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: Rp ${setTotal(kantong)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )),
      // Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       Text("${selectedDate}".split(' ')[0]),
      //       Text("${selectedDate}"),
      //       SizedBox(height: 20.0,),
      //       RaisedButton(
      //         onPressed: () => {
      //            _selectMonth(context),
      //           print(selectedDate.day + selectedDate.month + selectedDate.year )
      //         },

      //         child: Text('Pilih Tanggal'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
