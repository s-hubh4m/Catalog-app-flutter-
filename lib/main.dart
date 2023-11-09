// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/cart_page.dart';
import 'package:flutter_app1/pages/homepage.dart';
import 'package:flutter_app1/pages/login.dart';
import 'package:flutter_app1/utils/routes.dart';
import 'package:flutter_app1/widget/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     themeMode: ThemeMode.system,
     theme:MyTheme.lightTheme(context),
     darkTheme: MyTheme.DarkTheme(context),
     debugShowCheckedModeBanner: false,
     initialRoute: MyRoutes.loginRoute,
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoute:(context) => Homepage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.cartRoute:(context) => CartPage(),
        
      },
    );
  }
}

