class Menuproduk{
  int id;
  String img;
  String name;
  int price;
  int stock;
  String deskripsi;
  String kolek;
  Menuproduk({
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.stock,
    required this.deskripsi,
    required this.kolek
  });
  get json => Menuproduk(id: this.id, img: this.img, name: this.name, price: this.price, stock: this.stock, deskripsi: this.deskripsi , kolek: this.kolek);
}