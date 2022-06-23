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

  @override
  void initState() {
    super.initState();
  }

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
          print(selectedDate);
        });
      }
    });
  }

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
              .where("search".toLowerCase(),
                  isEqualTo: "${selectedDate}".split(' ')[0])
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return cardPendapatan(modulPendapatan(
                          namakantong: data['namakantong'],
                          namalengkap: data["namalengkap"],
                          alamat: data["alamat"]));
                    });
          }),
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
