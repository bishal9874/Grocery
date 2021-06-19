import 'package:Grocery/provider/shop_provider.dart';
import 'package:Grocery/screens/Auth/get_started_screen.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Shop UI - Drinks';
  final state = ShopProvider();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => state,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primaryColor: Colors.deepOrange,
            primaryColorDark: Colors.white,
            primaryColorLight: Color(0xFFf6f5ee),
          ),
          home: GetStarted(),
        ),
      );
}
