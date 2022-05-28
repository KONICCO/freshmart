
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartPage.dart';
import 'model.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Store"),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return CartPage();
                      },
                    ),
                  );
                },
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamProvider<List<Product>>(
        initialData: [],
        create: (_) => Provider.of<Store>(context).allProductsForSale,
        catchError: (BuildContext context, error) => <Product>[],
        updateShouldNotify: (List<Product> last, List<Product> next) => last.length == next.length,
        builder: (BuildContext context, List<Product> items, Widget child) {
          final items = context.watch<List<Product>>();
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              if (items.isEmpty) {
                return Text('no products for sale, check back later');
              }
              final item = items[index];
              return ListTile(
                title: Text(item.name ?? ''),
                subtitle: Text('cost: ${item.cost.toString() ?? 'free'}'),
                trailing: Text('Add to Cart'),
                onTap: () {
                  context.read<Cart>().addToCart(item);
                },
              );
            },
          );
        },
      ),
    );
  }
}
