

class Menu{
  String img;
  String name;

  Menu({
    required this.img,
    required this.name,
  });

  get json => Menu(img: this.img, name: this.name);
}