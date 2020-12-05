import 'package:Grocery/Auth%20widgets/Account_check.dart';
import 'package:Grocery/Auth%20widgets/loginTextContainer.dart';
import 'package:Grocery/Auth%20widgets/loginbackgroud.dart';
import 'package:Grocery/screens/Auth/SignUp_screen.dart';
import 'package:Grocery/screens/main_Catagory_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
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
      body: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.09),
              // Text(
              //   "Sign In your Account  ",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              // ),

              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.orange[200],
                size: height * 0.08,
              ),
              // SizedBox(height: size.height * 0.04),
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
                  // cursorColor: kPrimaryColor,
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
                  // cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      // color: kPrimaryColor,
                    ),
                    hintText: "Enter your password",
                    //border: InputBorder.,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ProgressButton(
                type: ProgressButtonType.Raised,
                color: Colors.deepOrange[400],
                height: height * 0.07,
                defaultWidget: Text(
                  'Sign In',
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
                    Get.to(MainScreen());
                    await Future.delayed(
                      Duration(seconds: 5),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () {
                  // Get.to(ForgotPasswordScreen());
                },
                child: Text(
                  "forget password ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Get.to(SignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
