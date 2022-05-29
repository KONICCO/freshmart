
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

cl
import 'model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<User>().name + 's Cart'),
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget child) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cart.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (cart.products.isEmpty) {
                      return Text('no products in cart');
                    }
                    final item = cart.products[index];
                    return ListTile(
                      title: Text(item.name ?? ''),
                      subtitle: Text('cost: ${item.cost.toString() ?? 'free'}'),
                      trailing: Text('tap to remove from cart'),
                      onTap: () {
                        context.read<Cart>().removeFromCart(item);
                      },
                    );
                  },
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'TOTAL: ${context.select((Cart c) => c.total)}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
