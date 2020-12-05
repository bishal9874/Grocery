import 'package:Grocery/screens/Orderdretails.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFf6f5ee),
          height: double.infinity,
          child: VStack([
            _orderContent(
                "assets/rice.png", "OASDCc234sd135435xadasd", "10 kg Rice","Jul 28",60, context),
            _orderContent("assets/mountdew.png", "OASDCc234sd135435xadasd","5 pc Mountdew",
                "Jul 27",30, context),
            _orderContent(
                "assets/Conflex.png", "OASDCc234sd135435xadasd", "5 kg Conflex","Jul 30",30, context),
          ]).scrollVertical(),
        ));
  }

  _orderContent(String url, String odrID, String quantity,String date,double price, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(id: odrID,foodName: quantity,pricePeritem: price,imgPAth: url,)
        ));

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFF68D7F).withOpacity(0.1),
                blurRadius: 3.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 1.0)),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: VStack([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Id: " + odrID,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            new Divider(),
           Row(children: [
             Image(height: height * 0.07, image: AssetImage(url)),
             SizedBox(
               width: width*0.03,
             ),

             VStack([
               Text(
                   "Delivered on " + date,
                 style: TextStyle(fontWeight: FontWeight.w700),
               ),
               SizedBox(
                 height: height*0.01,
               ),
               Text(quantity)
             ])
           ],),
            new Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Processing",
                  style: TextStyle(color: Colors.green[800]),
                  textAlign: TextAlign.right,
                ),
              ],
            )
          ]).p(5.0),
        ).p(10.0),
      ).p(5.0),
    );
  }
}
