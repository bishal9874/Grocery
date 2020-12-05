import 'package:Grocery/screens/OfferZoneScreen.dart';
import 'package:Grocery/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return VStack([

      new UserAccountsDrawerHeader(
        accountName: "Bishal Mondal".text.make(),
        accountEmail: "ecmt-18-025".text.make(),
        currentAccountPicture: new CircleAvatar(
          backgroundColor: Colors.white,
          child: "B".text.color(Colors.black).xl6.make(),
        ),
      ),
      new ListTile(
        title: "Home".text.make(),
        trailing: new Icon(Icons.home),
        onTap: () => Navigator.of(context).pop(),
      ),
      new ListTile(
        title: "My Order".text.make(),
        trailing: new Icon(Icons.local_offer),
      ),
      new ListTile(
          title: "My Cart".text.make(),
          trailing: new Icon(Icons.shopping_bag),
          onTap: () {
            Navigator.of(context).pop();
            Get.to(CartPage());
          }),
      new ListTile(
        title: "My Wishlist".text.make(),
        trailing: new Icon(Icons.favorite_sharp),
      ),
      new ListTile(
        title: "My offer Zone".text.make(),
        trailing: new Icon(Icons.local_offer_sharp),
        onTap: () {
          Navigator.of(context).pop();
          Get.to(           
            OfferZone(),
          );
        },
      ),
      new ListTile(
          title: "Log out".text.make(), trailing: new Icon(Icons.logout)),
      Container(
        child: Center(
          child: Image(
              height: height * 0.15,
              image: AssetImage("assets/Sampurno Logo.png")),
        ),
      ),
      // new Divider(),
    ]);
  }
}
