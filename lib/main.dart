import 'dart:io';

import 'package:ecommerce_api/AirLine_App/provider/AirLineProvider.dart';
import 'package:ecommerce_api/AirLine_App/view/screens/passengers_screen.dart';
import 'package:ecommerce_api/Developer_app/all_profile_screen.dart';
import 'package:ecommerce_api/Developer_app/developer_provider.dart';
import 'package:ecommerce_api/ecommerse_app/dio_helper.dart';
import 'package:ecommerce_api/ecommerse_app/provider/peoduct_provider.dart';
import 'package:ecommerce_api/ecommerse_app/view/main_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>(create: (context) {
        return ProductProvider();
      }),
      ChangeNotifierProvider<AirLineProvider>(create: (context) {
        return AirLineProvider();
      }),
      ChangeNotifierProvider<DeveloperProvider>(create: (context) {
        return DeveloperProvider();
      }),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Api")),
      body: Center(
          child: ElevatedButton(
        child: Text("Click"),
        onPressed: () {
          DioHelper.dioHelper.getAllProduct();
        },
      )),
    );
  }
}
