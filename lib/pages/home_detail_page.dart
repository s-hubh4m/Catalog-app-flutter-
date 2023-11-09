// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import, unnecessary_null_comparison, camel_case_types, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/catalog.dart';
import 'package:flutter_app1/utils/routes.dart';
import 'package:flutter_app1/widget/home_widgets/catalog_image.dart';
import 'package:flutter_app1/widget/home_widgets/catalog_list.dart';
import 'package:flutter_app1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class homeDetilsPage extends StatelessWidget {
  final Item catalog;
  const homeDetilsPage({
    Key? key,
    required this.catalog,
  }) :assert(catalog!=null),
   super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Container(
        color: MyTheme.creamColor,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:Vx.mOnly(right: 8),
                children: [
                  "\$${catalog.price}".text.bold.xl4.green600.make(),
                 AddToCart(catalog: catalog).wh(150,40)
                ],
                
              ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image)
            ).h32(context),
            Expanded(child: VxArc(
              height: 30,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                color: MyTheme.creamColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                     catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                10.heightBox,
            "Tempor no sed consetetur dolor elitr nonumy. Gubergren sea dolores et et aliquyam rebum, sit et at sanctus diam eos.".text.lg.textStyle(context.captionStyle).make().p16()
                
                  ],
                ).py64()
              ),
            )),
            


        ],
      )
    );
  }
}


//for a display of the item