import 'package:Grocery/data/products.dart';
import 'package:Grocery/data/tags.dart';
import 'package:Grocery/models/cart_item.dart';
import 'package:Grocery/provider/shop_provider.dart';
import 'package:Grocery/screens/allCatagories.dart';
import 'package:Grocery/screens/allCatagories.dart';
import 'package:Grocery/screens/products_details.dart';
import 'package:Grocery/transitions/custom_page_route.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double spacing = 12;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        color: Color(0xFFf6f5ee),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Catagory());
                      },
                      child: Column(
                        children: [
                          Container(
                              width: width * 0.12,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: SizedBox(
                                  width: width * 0.01,
                                  height: height * 0.01,
                                  child: Icon(Icons.category))),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          "All Catagories"
                              .text
                              .semiBold
                              .fontFamily("Poppins")
                              .make()
                        ],
                      ).p(width * 0.02),
                    ),
                    _catagories("assets/rice.png", "Rice", context),
                    _catagories("assets/monster.png", "Red Bull", context),
                    _catagories("assets/legs.png", "Energy Drinks", context),
                    _catagories("assets/redbull.png", "Red Bull", context),
                    _catagories("assets/redbull.png", "Red Bull", context),
                    _catagories("assets/redbull.png", "Red Bull", context),
                    // SizedBox(
                    // width: width * 0.04,
                    // ),
                  ],
                ).scrollHorizontal(),
                SizedBox(
                  height: height * 0.02,
                ),
                buildCarouselSlider(context),
                SizedBox(
                  height: height * 0.01,
                ),
                "Top Selling Products"
                    .text
                    .xl
                    .semiBold
                    .make()
                    .pOnly(left: 15.0),
                GridView.count(
                  padding: EdgeInsets.all(spacing),
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 3 / 4,
                  children: products
                      .map((product) => GestureDetector(
                            onTap: () {
                              final provider = Provider.of<ShopProvider>(
                                  context,
                                  listen: false);
                              provider.tag = Tags.imageProducts(product.imgUrl);

                              Navigator.of(context).push(CustomRoute(
                                child: ProductDetailsPage(product: product),
                              ));
                            },
                            child: buildProduct(product),
                          ))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Recommended Products".text.xl.semiBold.make(),
                    "See All".text.xl.bold.make()
                  ],
                ).p(2.0),
                SizedBox(
                  height: height*0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                     width: width*0.02,
                    ),
                  _recommended("assets/Dal.png", "Dal", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                  _recommended("assets/legs.png", "Legs", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                  _recommended("assets/Maggi.png", "Maggi", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                  _recommended("assets/rice.png", "Rice", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                  _recommended("assets/pepsi.png", "Pepsi", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                  _recommended("assets/musturdoil.png", "Musturd Oil", 60,  "70", "10kg", context),
                    SizedBox(
                      width: width*0.02,
                    ),
                ],).scrollHorizontal()
              ]),
        )).p(width * .02);
  }

  _recommended(String url, String Name, double price, String previousPrice,String content, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.15,
      width: width*0.25,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: height*0.09,
                child: Image(
                    image: AssetImage(url)),

              ),
            )
          ),
          HStack([
            Text('\$'+price.toString()),
            SizedBox(
              width: width*0.02,
            ),
            Text(
              '\$'+previousPrice,
              style: GoogleFonts.lato(
                  fontSize: 12.0,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w700,
                  textStyle: TextStyle(color: Colors.grey)),
            ),

          ]).p(2.0),
          SizedBox(
            height: height*0.01,
          ),
          Text(Name,style: TextStyle(fontWeight: FontWeight.w600),),

        ],
      ).p(3.0),
    );
  }

  _catagories(String img, String types, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Column(
        children: [
          Container(
              width: width * 0.12,
              height: height * 0.04,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SizedBox(
                width: width * 0.01,
                height: height * 0.04,
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              )),
          SizedBox(
            height: height * 0.01,
          ),
          types.text.semiBold.fontFamily("Poppins").make()
        ],
      ).p(width * 0.02),
    );
  }

  CarouselSlider buildCarouselSlider(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.7,
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        _sliderItem("assets/offer zone.jpg", context),
        _sliderItem("assets/offer.jpg", context),
        _sliderItem("assets/GroOffer.png", context),
      ],
    );
  }

  _sliderItem(String imgUrl, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          //margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              //borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image(
            height: height * 1.00,
            width: width * 1.00,
            image: AssetImage(imgUrl),
          )),
        ),
      ],
    );
  }

  // Widget buildProducts() {
  //   final double spacing = 12;
  //   return
  // }

  Widget buildProduct(CartItem product) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Hero(
                    tag: Tags.imageProducts(product.imgUrl),
                    child: Image.asset(product.imgUrl),
                  ),
                ),
              ),
              SizedBox(height: 10),
              HStack([
                Text(
                  '\$${product.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '\$${product.previousPrice}',
                  style: GoogleFonts.lato(
                      fontSize: 12.0,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w700,
                      textStyle: TextStyle(color: Colors.grey)),
                )
              ]),
              SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                product.content,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      );
}
