class UserModel {
  String? email;
  String? wrool;
  String? uid;
  var nama;
  var nomor;

// receiving data
  UserModel({ this.uid, this.email, this.wrool });
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'] ,
      email: map['email'],
      wrool: map['wrool'],

    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'wrool': wrool,
      'nama': nama,
      'nomor': nomor,
      'alamat': 'jember',
      'img': 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/profile-design-template-4c23db68ba79c4186fbd258aa06f48b3_screen.jpg?ts=1581063859',
    };
  }
}
