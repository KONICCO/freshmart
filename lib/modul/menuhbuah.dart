class Menubuah{
  int id;
  String img;
  String name;
  int price;
  int stock;
  Menubuah({
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.stock
  });
  get json => Menubuah(img: this.img, name: this.name, id: this.id, price: this.price, stock: this.stock);
}