import 'package:Grocery/Screen%20widgets/Drawer_Screen.dart';
import 'package:Grocery/Screen%20widgets/search_screen.dart';
import 'package:Grocery/provider/shop_provider.dart';
import 'package:Grocery/screens/Home_screen.dart';
import 'file:///F:/ui--ux/Grocery/lib/Screen%20widgets/Notification_screen.dart';
import 'package:Grocery/screens/OfferZoneScreen.dart';
import 'package:Grocery/screens/Profile_screen.dart';
import 'package:Grocery/screens/cart_screen.dart';
import 'package:Grocery/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            //automaticallyImplyLeading: f,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.filter_list, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            // title: Container(
            //   height: height*0.08,
            //   width: width,
            //   child: Row(
            //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //
            //     SizedBox(
            //       width: width*0.15,
            //     ),
            //
            //
            //   ]),
            // ),
            actions: [
              Container(
                height: height*0.05,
                width: width*0.20,
                child: Image(
                  //height: height * 0.10,

                  image: AssetImage("assets/appBarLogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
               width: width*0.02,
              ),

              HStack([
                IconButton(
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showSearch(context: context, delegate: DataScreah());
                    }),
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.to(NotificationScreen());
                    }),
                Stack(
                  children: [
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            provider.itemCount.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 12.0,
                                textStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Colors.black),
                      onPressed: () {
                        Get.to(CartPage());
                      },
                    ),

                  ],
                ),
              ]),
            ],
            // centerTitle: true,
            backgroundColor: Color(0xFFf6f5ee),
            elevation: 0.0,


          ),
        ),
        bottomNavigationBar: TabBar(

          tabs: [

            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.local_offer_sharp),
            ),
            Tab(
              icon: Icon(Icons.list_alt_sharp),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(8.0),
          indicatorColor: Colors.red,
        ),
        drawer: new Drawer(
          child: DrawerScreen(),
        ),
        body: TabBarView(children: [
          HomeScreen(),
          OfferZone(),
          OrderScreen(),
          MainProfile()
        ]),
      ),
    );
  }
}
