// import 'dart:convert';

import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class ProductScreen extends StatefulWidget {
  Product product;

  ProductScreen({required this.product, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: Image(
                            image:
                                NetworkImage(widget.product.image.toString()),
                            fit: BoxFit.fitHeight),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Container(
                          decoration: const ShapeDecoration(
                              color: CustomTheme.yellow,
                              shape: CircleBorder(),
                              shadows: [
                                BoxShadow(
                                  color: CustomTheme.grey,
                                  blurRadius: 3,
                                  offset: Offset(1, 3),
                                ),
                              ]),
                          child: IconButton(
                            icon: const Icon(Icons.share),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Text(widget.product.title),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                // Text("price:"),
                                Text(widget.product.price.toString() + " \$"),
                              ],
                            ),
                          ),
                          CustomButton(
                            text: "Add to Cart",
                            onPress: () {
                              Get.find<ProductController>()
                                  
                                  .addtocart(widget.product);
                            },
                            loading: addButtonLoad,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "About the item",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              widget.product.description,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 35,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(1, 3),
                            color: CustomTheme.grey)
                      ]),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
