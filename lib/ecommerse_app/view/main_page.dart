import 'dart:io';

import 'package:ecommerce_api/ecommerse_app/provider/peoduct_provider.dart';
import 'package:ecommerce_api/ecommerse_app/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<ProductProvider>(
        builder: (context, Provider, x) {
          return Column(
            children: [
              Provider.categories == null
                  ? const SizedBox()
                  : SizedBox(
                      height: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.selectedCategories('All');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Provider.selectedcategories == 'All'
                                        ? Colors.amber
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'All',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: Provider.categories!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.selectedCategories(
                                          Provider.categories![index]);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Provider.categories![index] ==
                                                  Provider.selectedcategories
                                              ? Colors.amber
                                              : Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        Provider.categories![index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
              // SizedBox(
              //   height: 70,
              //   child: Expanded(
              //       child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: Provider.categories!.length,
              //           itemBuilder: (context, index) {
              //             return GestureDetector(
              //               child: Container(
              //                   height: 60,
              //                   alignment: Alignment.center,
              //                   width: 60,
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: 5, vertical: 10),
              //                   margin: EdgeInsets.symmetric(
              //                       horizontal: 3, vertical: 10),
              //                   decoration: BoxDecoration(
              //                       color: Provider.categories![index] ==
              //                               Provider.selectedcategories
              //                           ? Colors.amber
              //                           : Colors.green,
              //                       borderRadius: BorderRadius.circular(50)),
              //                   child: Container(
              //                     height: 60,
              //                     width: 60,
              //                     child: CircleAvatar(

              //                       backgroundImage: AssetImage(
              //                           Provider.products![index].image!,),
              //                     ),
              //                   )),
              //               onTap: () {},
              //             );
              //           })),
              // ),
              Expanded(
                child: Provider.products == null
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      )
                    : ListView.builder(
                        itemCount: Provider.products!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Provider.getOneProduct(
                                  Provider.products![index].id!);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ProductDetails();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image.network(
                                      Provider.products![index].image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          Provider.products![index].title!,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          Provider
                                              .products![index].description!,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          Provider.products![index].price!
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
