import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 30),
            itemCount: Get.find<ProductController>().cartProduct.length,
            itemBuilder: (context, index) {
              return Container(
                height: 123,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                decoration: CustomTheme.getCardDecoration(),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            height: double.infinity,
                            child: Image(
                                image: NetworkImage(
                                    Get.find<ProductController>()
                                        .cartProduct[index]
                                        .image),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    Get.find<ProductController>()
                                        .cartProduct[index]
                                        .title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "\$ ${Get.find<ProductController>().cartProduct[index].price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Get.find<ProductController>().delete(
                                          Get.find<ProductController>()
                                              .cartProduct[index]
                                              .id);
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          priceFooter(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: CustomButton(
              text: "CHECKOUT",
              onPress: () {},
              loading: false,
            ),
          ),
        ],
      ),
    );
  }

  priceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 2,
            color: CustomTheme.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text("Total: ",
                    style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text("\$ ${Get.find<ProductController>().getTotalPrice()}",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
