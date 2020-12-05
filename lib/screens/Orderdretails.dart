import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetailsScreen extends StatelessWidget {
  final imgPAth, foodName, pricePeritem, id;

  OrderDetailsScreen({this.imgPAth, this.foodName, this.pricePeritem, this.id});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: "Order Details".text.make(),
      ),
      body: Container(
        child: VStack([
          Text(
            "Order ID - " + id,
            style: GoogleFonts.raleway(color: Colors.grey[700]),
          ),
          new Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VStack([
                Text(
                  foodName,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700, fontSize: 25.0),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "\$" + pricePeritem.toString(),
                  style: GoogleFonts.raleway(fontSize: 18.0),
                ),
              ]).p(5.0),
              Image(height: height * 0.09, image: AssetImage(imgPAth)),
            ],
          ).p(10.0),
          new Divider(),
          Text(
            "Price Details",
            style: GoogleFonts.raleway(fontSize: 18.0, color: Colors.grey),
          ),
          // new Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "List Price",
                style: GoogleFonts.raleway(fontSize: 15.0),
              ),
              Text(
                "\$60",
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          SizedBox(
            height: height*0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Selling Price",
                style: GoogleFonts.raleway(fontSize: 15.0),
              ),
              Text(
                "\$30",
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          SizedBox(
            height: height*0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping fee",
                style: GoogleFonts.raleway(fontSize: 15.0),
              ),
              Text(
                "\$2",
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          SizedBox(
            height: height*0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Discount",
                style: GoogleFonts.raleway(fontSize: 15.0),
              ),
              Text(
                "-\$2",
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          SizedBox(
            height: height*0.01,
          ),
          new Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: GoogleFonts.raleway(fontSize: 15.0),
              ),
              Text(
                "\$30",
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.black)),
              ),
            ],
          ),

        ]).p(10.0),
      ),
    );
  }
}
