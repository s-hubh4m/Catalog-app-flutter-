// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
     fontFamily: GoogleFonts.poppins().fontFamily,
     appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color:MyTheme.darkBluishColor),
     ),
     textTheme: Theme.of(context).textTheme

  );
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    cardColor: Colors.black,
    canvasColor: MyTheme.darkCreamColor,
     fontFamily: GoogleFonts.poppins().fontFamily,
     appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color:MyTheme.darkBluishColor),
     ),
     textTheme: Theme.of(context).textTheme
  );

  static Color creamColor =Color(0xfff5f5f5);
  static Color darkBluishColor =Color.fromARGB(255, 19, 24, 127);
  static Color darkCreamColor= Color(0xff0b0b0b);
  static Color lighBluishColor= Vx.purple400;


  


}

