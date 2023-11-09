// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import, unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_app1/models/cart.dart';
import 'package:flutter_app1/models/catalog.dart';
import 'package:flutter_app1/pages/home_detail_page.dart';
import 'package:flutter_app1/pages/homepage.dart';
import 'package:flutter_app1/widget/home_widgets/catalog_image.dart';
import 'package:flutter_app1/widget/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder:(context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(
          builder: (context) => homeDetilsPage(
            catalog: catalog, 
            )
            )
            ) ,
        child: CatalogItem(catalog: catalog));
    }
    );   
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
     required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
         Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding:Vx.mOnly(right: 8),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog ,)
              ],
              
            ),
          ],
         ))
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}

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
    bool isInCart=_cart.items.contains(widget.catalog)?? false;
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
     child: isInCart? Icon(Icons.done) :"Add to cart".text.bold.make(),
     
    );
  }
}