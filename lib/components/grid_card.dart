import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utils/custom_theme.dart';
import 'package:flutter/material.dart';


class GridCard extends StatelessWidget {
  final Product product;
  
   GridCard({super.key, required this.product });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      decoration: CustomTheme.getCardDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
              
                child: Image.network(product.image),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      product.price.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
