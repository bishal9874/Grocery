

import 'package:Grocery/data/allCatagoies_data.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Catagory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Catagories"),
      ),
      body:
           GridView.builder(
            itemCount: CATAGORY_DATA.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index){
              return Product(
                product_name: CATAGORY_DATA[index]["name"],
                product_pic: CATAGORY_DATA[index]["image"],
              );
              }
          ),
        );
  }
}
class Product extends StatelessWidget {
  final product_name;
  final product_pic;
  Product({
    this.product_name,
    this.product_pic,
});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      child:
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Image(
           height: height*0.09,
             image: AssetImage(product_pic)),
          SizedBox(
            height: height*0.02,
          ),
         Text(
           product_name,
            style: TextStyle(fontWeight: FontWeight.bold),
         )
       ],)

    );
  }
}

