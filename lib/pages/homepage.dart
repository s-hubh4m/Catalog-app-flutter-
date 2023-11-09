// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_const_constructors, unused_import

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/utils/routes.dart';
import 'package:flutter_app1/widget/home_widgets/catalog_header.dart';
import 'package:flutter_app1/widget/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_app1/models/catalog.dart';
import 'package:flutter_app1/widget/drawer.dart';
import 'package:flutter_app1/widget/item_widget.dart';
import 'package:flutter_app1/widget/themes.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int day = 30;

  final String name = "development";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
      backgroundColor: MyTheme.darkBluishColor,
      child: Icon(
        CupertinoIcons.cart
      ),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py12().expand()
              else
                CircularProgressIndicator().centered().p16().expand()


            ],
          ),
        ),
      ),
      
      
      
    );
  }
}

