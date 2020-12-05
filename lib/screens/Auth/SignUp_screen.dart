import 'package:Grocery/Auth%20widgets/loginTextContainer.dart';
import 'package:Grocery/screens/Auth/Otp_screen.dart';
import 'package:Grocery/screens/Auth/login_screen.dart';

import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    Key key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

//    final AuthController controller = Get.put(AuthController());

    return Scaffold(
        body: VStack([
      Container(
        child: ZStack([
          ClipRRect(
            child: Image(
              height: height * 0.20,
              width: width * 1.0,
              image: AssetImage("assets/1.png"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height * 0.03,
            child: Container(
              height: height * 0.10,
              width: width * 1.00,
              child: Center(
                  child: Text(
                "Sign Up",
                style: GoogleFonts.raleway(
                    fontSize: height * 0.04,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
            ),
          )
        ]),
      ),
      VStack([
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: size.height * 0.07),

              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name can't be Empty";
                    } else if (value.length < 10) {
                      return "Fill up with full name";
                    }
                    return null;
                  },
                  //keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_outlined),
                    hintText: "Enter your Full Name ",
                    //border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  // keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your Email ",
                    //border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid password.';
                    } else if (!RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$")
                        .hasMatch(value)) {
                      return 'Password should be alphanumeric and 8 characters long';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                    ),
                    hintText: "Enter your password",
                    //border: InputBorder.,
                  ),
                  obscureText: true,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter a mobile number";
                    } else if (value.length < 10) {
                      return "please enter a valid mobile number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      // color: kPrimaryColor,
                    ),
                    hintText: "Enter 10 digit phone no",
                    //border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                padding: EdgeInsets.all(5.0),
                child: CheckboxListTileFormField(
                  activeColor: Colors.deepOrange,
                  title: Text(
                    "Agree to all terms and conditions",
                    style: TextStyle(
                        color: Color(0xFF988787),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  onSaved: (bool value) {},
                  validator: (bool value) {
                    if (value) {
                      return null;
                    } else {
                      return 'please accept terms conditions';
                    }
                  },
                ),
              ),
              ProgressButton(
                type: ProgressButtonType.Raised,
                color: Colors.deepOrange[400],
                height: height * 0.07,
                defaultWidget: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
                progressWidget: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                width: width * 0.9,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Get.to(OtpScreen());
                    await Future.delayed(
                      Duration(seconds: 5),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Already have an Account".text.make(),
                  SizedBox(height: size.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      "Sign in >",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ])
    ]).scrollVertical());
  }
}
