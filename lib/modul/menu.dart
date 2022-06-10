

class Menu{
  String img;
  String name;
  int id;
  Menu({
    required this.img,
    required this.name,
    required this.id
  });

  get json => Menu(id: this.id,img: this.img, name: this.name);
}