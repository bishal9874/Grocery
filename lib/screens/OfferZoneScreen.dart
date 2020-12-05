import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OfferZone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VStack([
      Image(image: AssetImage("assets/GroOffer.png")),
      Image(image: AssetImage("assets/megaOffer.png")),
      Image(image: AssetImage("assets/offer.jpg")),
      Image(image: AssetImage("assets/offer zone.jpg")),
    ]).scrollVertical());
  }
}
