
import 'package:firebase_auth/firebase_auth.dart';

class Usercart{
  
  String userid;

  Usercart({
    
    required this.userid,
  });

  get json => Usercart( userid: this.userid);
}