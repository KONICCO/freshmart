class UserModel {
  String? email;
  String? wrool;
  String? uid;
  String? nomor;
  String? nama;

// receiving data
  UserModel({this.uid, this.email, this.wrool ,this.nomor, this.nama});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      wrool: map['wrool'],
      nomor: map['nomor'],
      nama: map['nama']
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'wrool': wrool,
      'nama': nama,
      'nomor': nomor
    };
  }
}
