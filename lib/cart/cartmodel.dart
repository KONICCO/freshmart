

class Cart {
  String userid;
  int id;
  String name;
  String img;
  int price;
  int jumlahbeli;
    

  Cart({
    required this.userid,
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.jumlahbeli,
  });
  get json => Cart(img: this.img, name: this.name, jumlahbeli: this.jumlahbeli, price: this.price, id: this.id, userid: this.userid);
}