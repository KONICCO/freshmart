class detail {
  String img;
  String name;
  int jumlahbeli;
  int harga;

  detail(
      {required this.img,
      required this.name,
      required this.jumlahbeli,
      required this.harga});

  get json => detail(
      img: this.img,
      jumlahbeli: this.jumlahbeli,
      name: this.name,
      harga: this.harga);
}
