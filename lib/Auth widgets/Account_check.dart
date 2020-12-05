import 'package:flutter/material.dart';



class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
   // var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: height*0.01,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up >" : "Sign In",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
