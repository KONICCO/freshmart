// The product class does nothing fancy
class Product {
  final String name;
  final double cost;

  Product({this.name, this.cost});
}

// This class tracks the products that 
// the user wants to buy, and it's a [ChangeNotifier]
class Cart with ChangeNotifier {
  List<Product> products = [];

  double get total {
    return products.fold(0.0, (double currentTotal, Product nextProduct) {
      return currentTotal + nextProduct.cost;
    });
  }

  void addToCart(Product product) => products.add(product);
  void removeFromCart(Product product) {
    products.remove(product);
    notifyListeners();
  }
}

// The user class does nothing fancy.
class User {
  final String name;
  final Cart cart;

  User({this.name, this.cart});
}

class Store {
  // Perhaps we're going to use a StreamProvider?
  StreamController<List<Product>> _streamController = StreamController<List<Product>>();
  Stream<List<Product>> get allProductsForSale => _streamController.stream;
  
  // rest of class
}

// This class is a singleton that mocks out two pieces of functionality:
// Logging in a user
// And fetching products from a realtime data base (like FireStore)
class MockDatabase {
  static final MockDatabase _instance = MockDatabase._internal();

  factory MockDatabase() {
    return _instance;
  }

  MockDatabase._internal();

  Future<User> login() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return User(name: 'Yohan', cart: Cart());
    });
  }

  // Imagine this is like calling Firestore.get('products').listen(...);
  // Anytime there are new products in the databse, they'll be pushed down
  // to the app.
  Stream<List<Product>> getProductsBatched() async* {
    List<Product> allProducts = [];

    var i = 0;
    while (i < 10) {
      await Future.delayed(Duration(seconds: 1), () {
        allProducts.add(_productsInDatabase[i]);
      });
      i++;
      yield allProducts;
    }
  }
  // rest of class...

}