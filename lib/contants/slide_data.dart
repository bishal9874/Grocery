import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String imgUrl2;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.imgUrl2,
  });
}

final slideList = [
  Slide(
      imageUrl: "assets/grocery.png",
      title:
      "Grocery Shopping Listonic. this App makes the shopping faster and easieer by improving the quality of Grocery Shopping.",
          
      imgUrl2: "assets/fast_delivery.png"  
          ),

  Slide(
      imageUrl: 'assets/shopping woman.png',
      title:"Grocery delivery is safe if the provider follows good personal and food hygiene",
          
          imgUrl2: "assets/online delivery.png"
          ),
  Slide(
      imageUrl: "assets/delivery.jpg",
      title:
          "Grocery shopping is among the most unavoidable errands often done every weeek.",
          imgUrl2: "assets/fresh product.png"
          ),
];
