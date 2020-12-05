import 'package:Grocery/contants/slide_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



import 'package:velocity_x/velocity_x.dart';


class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ZStack([
           Positioned(
             top: height*0.38,
             right: width*0.01,
             left: width*0.01,
                        child: ClipPath(
              child: Image(
                height: height*0.50,
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
          )),
           ),
           
           
            Positioned(
              top: height*0.03,
                          child: Container(
                 height: height*0.10,
               width: width*0.95,
                 child: Center(
                   child: Image(
                    image: AssetImage(slideList[index].imgUrl2),
                    fit: BoxFit.cover,
          ),
                 ),
                          ),
            ),
             Positioned(
              top: height*0.15,
                          child: Container(
                 height: height*0.15,
               width: width*0.95,
                 child: Center(
                   child: Text(
                     slideList[index].title,
                     textAlign: TextAlign.center,
                     style: GoogleFonts.raleway(
                       fontSize: height*0.02,
                       fontWeight: FontWeight.w600

                     ),
                   ).p(height*0.03)
                 ),
                          ),
            )
          
        
     
    ]);
  }
}
