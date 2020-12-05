import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: size.height,
      // decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //    end: Alignment.bottomCenter,
      //     stops: [0.0, 0.4, 0.7, 0.9],
      //     colors: [
      //       Color(0xFFf5f1e4),
      //       Color(0xFFf5eac6),
      //       Color(0xFFf2aa83),
      //       Color(0xFFe6ac97),
      //     ],
      //   )) ,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ZStack([
            
            ClipRRect(
                child: Image(
              height: height*0.20,
              width: width*1.0,
                  image: AssetImage("assets/1.png"),
                  fit: BoxFit.cover,
                  
                    ),
            ),
            
             Positioned(
              top: height*0.03,
                          child: Container(
                 height: height*0.10,
               width: width*1.00,
                 child: Center(
                   child:Text(
                      "Sign In",
                      style: GoogleFonts.raleway(
                        fontSize: height*0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                   )
                 ),
               ),
            )
          ]),
          
         
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}
