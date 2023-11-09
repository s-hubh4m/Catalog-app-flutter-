// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/cart.dart';
import 'package:flutter_app1/models/catalog.dart';
import 'package:flutter_app1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';




class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
   

  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(widget.catalog);
    return ElevatedButton(onPressed: () {
      isInCart = isInCart.toggle();
      if(!isInCart){
         isInCart = isInCart.toggle();
      final catalog = CatalogModel();
      _cart.catalog = catalog;
      _cart.add(widget.catalog);
      
      setState(() {
        
      });
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
      shape: MaterialStateProperty.all(StadiumBorder())
      
    ),
     child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
     
    );
  }
}