class Menubuah{
  int id;
  String img;
  String name;
  int price;
  int stock;
  String deskripsi;
  Menubuah({
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.stock,
    required this.deskripsi
  });
  get json => Menubuah(id: this.id, img: this.img, name: this.name, price: this.price, stock: this.stock, deskripsi: this.deskripsi);
}