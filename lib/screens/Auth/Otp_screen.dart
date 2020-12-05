import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

// import 'package:lessons/constants/constants.dart';
// import 'package:lessons/screens/auth/institute_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VStack(
              [
                Text('OTP Verification',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 25.0,
                            color: Color(0xFF4B4B5B)))
                    .centered(),

                SizedBox(
                  height: height * 0.04,
                ),

                // SizedBox(height:height*0.01),
                '4 Digit One Time Password '
                    .text
                    .center
                    .size(15.0)
                    .make()
                    .centered()
                    .p(10.0),
              ],
            ),
            Center(
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50,
                fieldStyle: FieldStyle.underline,
                style: TextStyle(fontSize: 17),
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            'Enter the OTP manually if not readed '
                    'automatically with 10 second'
                .text
                .center
                .color(Colors.red[900])
                .size(width * 0.04)
                .make()
                .centered()
                .p(height * 0.05),
          ],
        ),
      ),
    ));
  }
}
