import 'package:Grocery/models/cart_item.dart';
import 'package:Grocery/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                   setState(() {
                   });
                  },
                  child: Text('Clear Cart'),
                  textColor: Colors.black,
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: buildCardItems(context),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  '\$80.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardItems(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);

    if (provider.items.isEmpty) {
      return Center(
        child: Text(
          'Cart Is Empty',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      );
    } else {
      return ListView(
        physics: BouncingScrollPhysics(),
        children: provider.items.values.map(buildCardItem).toList(),
      );
    }
  }

  Widget buildCardItem(CartItem cartItem) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(cartItem.imgUrl),
        ),
        title: Row(
          children: [
            Text(
              '${cartItem.quantity}x',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                cartItem.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        trailing: Text(
          '\$${cartItem.price}',
          style: TextStyle(color: Colors.black),
        ),
      );
}
