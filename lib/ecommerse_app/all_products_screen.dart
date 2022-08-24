import 'dart:developer';

import 'package:ecommerce_api/ecommerse_app/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/peoduct_provider.dart';

class AllProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("All Products")),
      body: Consumer<ProductProvider>(
        builder: (context, Provider, x) {
          return ListView.builder(
              itemCount: Provider.products?.length ?? 0,
              itemBuilder: (context, index) {
                return Center(
                  child: ElevatedButton(
                    child: Text('Get Catigories'),
                    onPressed: () async {
                      List<String> categories =
                          await DioHelper.dioHelper.getAllCategories();
                      print(categories);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
