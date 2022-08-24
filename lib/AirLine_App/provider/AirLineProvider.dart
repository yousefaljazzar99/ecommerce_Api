import 'package:ecommerce_api/AirLine_App/models/airline_dio_helper.dart';
import 'package:ecommerce_api/AirLine_App/models/passengerResponse.dart';
import 'package:flutter/material.dart';

class AirLineProvider extends ChangeNotifier {
  AirLineProvider() {
    getPassengers();
    notifyListeners();
  }
  int page = 0;
  bool isLoading = false;
  getMorePassengers() {
    page++;
    getPassengers();
    // notifyListeners();
  }

  List<Passengers> passengers = [];
  getPassengers() async {
    isLoading = true;
    notifyListeners();
    PassengerResponse passengerResponse =
        await AirLineDioHelper.airLineDioHelper.getPassengers(page);
    passengers.addAll(passengerResponse.data ?? []);
    isLoading = false;
    notifyListeners();
  }
}
