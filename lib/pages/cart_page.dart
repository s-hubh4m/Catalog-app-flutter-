// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app1/models/cart.dart';
import 'package:flutter_app1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
        title: "Cart".text.color(MyTheme.darkBluishColor).align(TextAlign.right).scale(2.5).make(),
        centerTitle: true,
      ),
    body: Column(
      children: [
        _CartList(

        ).p32().expand(),
        Divider(),
        _CartTotal(),
      ],
    ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(MyTheme.darkBluishColor)
            ),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet".text.make()
                  )
                  );
            }, 
          child: "Buy".text.color(Colors.white).make()
          ).w20(context)

        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing:IconButton(
          onPressed: (){
            _cart.remove(_cart.items[index]);
            setState(() {
              
            });
          }, 
        icon: Icon(Icons.remove_circle_outline),
        ) ,
        title: _cart.items[index].name.text.make(),
      ),
      );
  }
}