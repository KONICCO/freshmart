import 'package:firebase_auth/firebase_auth.dart';

class pesananUser {
  String userid;

  pesananUser({
    required this.userid,
  });

  get json => pesananUser(userid: this.userid);
}
