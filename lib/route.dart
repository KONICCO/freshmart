import 'package:flutter/widgets.dart';

import 'package:bisa/buah.dart';
import 'package:bisa/kategori.dart';
import 'package:bisa/login_screen.dart';
import 'package:bisa/main.dart';
import 'package:bisa/pagebuah1.dart';
import 'package:bisa/signup_screen.dart';
import 'package:bisa/splash_screen.dart';
import 'package:bisa/profile/profile_screen.dart';
import 'package:bisa/profile/components/body.dart';
import 'package:bisa/profile/components/profile_menu.dart';
import 'package:bisa/profile/components/profile_pic.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
