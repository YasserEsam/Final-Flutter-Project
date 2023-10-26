
import 'package:ecommerce/components/grid_card.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:get/get_core/src/get_main.dart';
import '../components/carouselsliderwidget.dart';
import 'product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    
    return Container(
      child: Column(
        children: [
          // CarouselSliderWidget(autoplay: true, size: 300),
          Expanded(
            child: FutureBuilder(
              future: Get.find<ProductController>().getProductFromIpi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(
                  itemCount: Get.find<ProductController>().producList.length,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProductScreen(
                          product:
                              Get.find<ProductController>().producList[index],
                        ));
                      },
                      child: GridCard(
                        product:
                            Get.find<ProductController>().producList[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
