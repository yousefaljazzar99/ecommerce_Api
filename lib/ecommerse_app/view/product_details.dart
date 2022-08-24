import 'dart:ffi';

import 'package:ecommerce_api/ecommerse_app/provider/peoduct_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ProductProvider>(builder: (context, Provider, X) {
      return Scaffold(
        appBar: AppBar(
          title: Text(Provider.selectedProduct!.title ?? 'Loading...'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Provider.selectedProduct == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child:
                          Image.network(Provider.selectedProduct!.image ?? ''),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        Provider.selectedProduct!.title ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child:
                            Text(Provider.selectedProduct!.description ?? '')),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      Provider.selectedProduct!.price.toString() + '  \$',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
