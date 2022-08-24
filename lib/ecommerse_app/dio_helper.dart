import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/ecommerse_app/PostRequest.dart';
import 'package:ecommerce_api/ecommerse_app/models/product.dart';

class DioHelper {
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dio = Dio();
  Future<List<Product>> getAllProduct() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List responceList = response.data;
    List<Product> products = responceList.map((e) {
      return Product.fromJson(e);
    }).toList();

    return products;
  }

  Future<List<String>> getAllCategories() async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/categories');
    List cat = response.data;
    List<String> categories = cat.map((e) => e.toString()).toList();
    return categories;
  }

  Future<List<Product>> getCategoriesProduct(String Categories) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$Categories');
    List responceList = response.data;
    List<Product> products = responceList.map((e) {
      return Product.fromJson(e);
    }).toList();

    return products;
  }

  Future<Product> getOneProduct(int id) async {
    Response response = await dio.get('https://fakestoreapi.com/products/$id');
    return Product.fromJson(response.data);
  }

  CreateNewPost(PostRequest postRequest) async {
    Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: postRequest.toJson());
    log(response.data.toString());
  }
}
