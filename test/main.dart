import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductsPage.dart';
import 'model.dart';

void main() async {
  final user = await MockDatabase().login();

  runApp(
    MultiProvider(
      providers: [
        Provider<User>.value(value: user),
        Provider<Store>(create: (_) => Store()),
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsPage(),
    );
  }
}
