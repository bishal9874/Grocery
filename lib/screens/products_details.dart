import 'package:Grocery/data/SellerData.dart';
import 'package:Grocery/data/tags.dart';
import 'package:Grocery/models/cart_item.dart';
import 'package:Grocery/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailsPage extends StatefulWidget {
  final CartItem product;

  const ProductDetailsPage({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var quantity = 1;
  bool Liked = false;

  _pressed(){
    setState(() {
      Liked =! Liked;
    });
  }

  List<SellerData> _seller = SellerData.getSeller();
  List<DropdownMenuItem<SellerData>> _dropdownMenuItems;
  SellerData _selectedSeller;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_seller);
    _selectedSeller = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<SellerData>> buildDropdownMenuItems(List sellers) {
    List<DropdownMenuItem<SellerData>> items = List();
    for (SellerData seller in sellers) {
      items.add(DropdownMenuItem(
        value: seller,
        child: Text(seller.name),
      ));
    }
    return items;
  }

  onChangeDropItem(SellerData selectedSeller) {
    setState(() {
      _selectedSeller = selectedSeller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final provider = Provider.of<ShopProvider>(context, listen: false);
        provider.tag = Tags.imageProducts(widget.product.imgUrl);

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Color(0xFFf6f5ee),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: buildProduct(context),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShuttle(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final provider = Provider.of<ShopProvider>(flightContext, listen: false);
    if (flightDirection == HeroFlightDirection.pop &&
        Tags.isImageCartTag(provider.tag)) {
      return FittedBox(fit: BoxFit.cover, child: toHeroContext.widget);
    } else {
      return FittedBox(fit: BoxFit.contain, child: toHeroContext.widget);
    }
  }

  Widget buildProduct(BuildContext context) {
    final tag = Provider.of<ShopProvider>(context).tag;

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: Hero(
              flightShuttleBuilder: buildShuttle,
              tag: tag,
              child: Image.asset(widget.product.imgUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        buildTexts(),
        SizedBox(height: 24),
        Container(
          height: 50,
          width: 200,
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<ShopProvider>(context, listen: false);

              provider.tag = Tags.imageCart(widget.product.imgUrl);
              provider.addItem(product: widget.product);

              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildTexts() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(icon: Icon( Liked ?
                    Icons.favorite_border : Icons.favorite,
                    color: Liked ? Colors.grey : Colors.red,
                ), onPressed: _pressed(),)
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildQuantity(),
                Container(
                  child: HStack(
                    [
                      Text(
                        '\$' +
                            (double.parse(widget.product.price
                                        .toStringAsFixed(0)) *
                                    quantity)
                                .toStringAsFixed(0),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '\$${widget.product.previousPrice}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${widget.product.persentoff}% off',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 32),
            Text(
              'About The Product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Text(
              widget.product.description,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: _selectedSeller,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropItem,
                ),
              ],
            )
          ],
        ),
      );

  Widget buildQuantity() {
    final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        children: [
          MaterialButton(
            minWidth: 60,
            child: Text('—', style: style),
            onPressed: () {
              adjustQuantity("MINUS");
            },
          ),
          Text(quantity.toString(), style: style),
          MaterialButton(
            minWidth: 60,
            child: Text('+', style: style),
            onPressed: () {
              adjustQuantity("PLUS");
            },
          ),
        ],
      ),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
