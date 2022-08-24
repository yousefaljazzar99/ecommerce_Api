import 'package:ecommerce_api/Developer_app/dio_helper.dart';
import 'package:ecommerce_api/Developer_app/profile_responce.dart';
import 'package:ecommerce_api/ecommerse_app/dio_helper.dart';
import 'package:flutter/material.dart';

class DeveloperProvider extends ChangeNotifier {
  DeveloperProvider() {
    getAllProfile();
    notifyListeners();
  }

  List<ProfileResponce> profile = [];
  getAllProfile() async {
    ProfileResponce profileResponce =
        await DeveloperDioHelper.developerDioHelper.getAllProfile();

    notifyListeners();
  }
}
