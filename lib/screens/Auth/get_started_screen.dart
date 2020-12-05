import 'package:Grocery/Auth%20widgets/slide_dots.dart';
import 'package:Grocery/Auth%20widgets/slide_item.dart';
import 'package:Grocery/contants/slide_data.dart';
import 'package:Grocery/screens/Auth/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  TextEditingController numController = new TextEditingController();

  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    print(context.mdWindowSize);
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: VStack(
          [
            Expanded(
              child: Stack(
                //alignment: AlignmentDirectional.bottomCenter,
                alignment: AlignmentDirectional.bottomStart,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i) => SlideItem(i),
                  ),
                  Container(
                    height: height * 0.10,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //height: height * 0.06,
                          child: Center(
                            child: Row(
                              /// mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                for (int i = 0; i < slideList.length; i++)
                                  if (i == _currentPage)
                                    SlideDots(true)
                                  else
                                    SlideDots(false),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.red[600],
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).p(10.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ).p(10.0),
    );
  }
}
