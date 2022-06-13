import 'package:firebase_auth/firebase_auth.dart';

class pesananUser {
  String userid;
  String namakantong;
  String namalengkap;
  String alamat;

  pesananUser(
      {required this.userid,
      required this.namakantong,
      required this.namalengkap,
      required this.alamat});

  get json => pesananUser(
      userid: this.userid,
      namakantong: this.namakantong,
      namalengkap: this.namalengkap,
      alamat: this.alamat);
}
