import 'package:cloud_firestore/cloud_firestore.dart';

class databasecart {
  // static Future<void> getcart( String userid,) async {
  //   CollectionReference cart = FirebaseFirestore.instance.collection("users").doc(userid).collection("cart");
  //   await  cart.doc().get();
  // }
  static Future<void> updatecart(String userid, int produkid,
      {String? name, String? img, int? price, int? jumlahbeli}) async {
    CollectionReference cartupdate = FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection("cart");
    await cartupdate.doc("$produkid").set({
      'id': produkid,
      'name': name,
      'img': img,
      'price': price,
      'jumlahbeli': jumlahbeli,
    });
  }

  static Future<void> createNotif(String userid) async {
    CollectionReference notifCreate = FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection("notif");
    await notifCreate.doc().set({
      'notif':
          "Terima kasih telah berbelanja! Silahkan cek pesanan Anda pada halaman pesanan",
    });
  }

  static Future<void> kantongcart(String userid,
      {String? name,
      String? kantong,
      String? alamat,
      String? tanggal,
      String? total}) async {
    CollectionReference tambahkantong = FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection("pesanan");
    await tambahkantong.doc().set({
      'namalengkap': name,
      'namakantong': kantong,
      'alamat': alamat,
      'tanggal': tanggal,
      'total': total,
    });
    CollectionReference tambahkantong1 =
        FirebaseFirestore.instance.collection("kantong");
    await tambahkantong1.doc().set({
      'namalengkap': name,
      'namakantong': kantong,
      'alamat': alamat,
      'tanggal': tanggal,
      'total': total,
    });
  }

  static Future<void> kantongdetail(
      String userid, String namakantong, int produkid,
      {String? name, String? img, int? price, int? jumlahbeli}) async {
    CollectionReference detailkantong = FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection(namakantong);
    await detailkantong.doc("${produkid}").set({
      'id': produkid,
      'name': name,
      'img': img,
      'price': price,
      'jumlahbeli': jumlahbeli,
    });
    CollectionReference detailkantong1 =
        FirebaseFirestore.instance.collection(namakantong);
    await detailkantong1.doc("${produkid}").set({
      'id': produkid,
      'name': name,
      'img': img,
      'price': price,
      'jumlahbeli': jumlahbeli,
    });
  }

  static Future<void> hapuscart(
    String userid,
    int produkid,
  ) async {
    CollectionReference carthapus = FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection("cart");
    await carthapus.doc("$produkid").delete();
  }
}
