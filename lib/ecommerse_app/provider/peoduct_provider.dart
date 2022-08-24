import 'package:ecommerce_api/ecommerse_app/dio_helper.dart';
import 'package:ecommerce_api/ecommerse_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    getCatigores();
    getAllProduct();
    getCategoiresProduct();
  }
  String selectedcategories = 'All';

  List<String>? categories;
  List<Product>? products;
  Product? selectedProduct;
  getOneProduct(int id) async {
    selectedProduct == null;
    notifyListeners();
    selectedProduct = await DioHelper.dioHelper.getOneProduct(id);
    notifyListeners();
  }

  selectedCategories(String categories) {
    selectedcategories = categories;
    products == null;
    notifyListeners();
    if (categories == 'All') {
      getAllProduct();
    } else {
      getCategoiresProduct();
    }
  }

  getAllProduct() async {
    products = await DioHelper.dioHelper.getAllProduct();
    notifyListeners();
  }

  getCatigores() async {
    categories = await DioHelper.dioHelper.getAllCategories();
    notifyListeners();
  }

  getCategoiresProduct() async {
    products =
        await DioHelper.dioHelper.getCategoriesProduct(selectedcategories);
    notifyListeners();
  }
}
