import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import './product.dart';

class productDetails extends StatelessWidget {
  final Product product;

  productDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${product.productName}")),
      body: productBody(product),
    );
  }
}

class productBody extends StatelessWidget {
  final Product fproduct;

  productBody(this.fproduct);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          "${fproduct.productImage}",
          width: 400.0,
          height: 400.0,
        ),
        SizedBox(height: 10.0),
        Text(
          "product name: ${fproduct.productName}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            fontFamily: "Lato",
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          "price: ${fproduct.price}\$",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            fontFamily: "Lato",
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          "Details: ${fproduct.description}",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            fontFamily: "Lato",
          ),
        ),
        SizedBox(height: 12.0),
        ElevatedButton(onPressed: () {}, child: Text("Buy Now"))
      ]),
    );
  }
}
