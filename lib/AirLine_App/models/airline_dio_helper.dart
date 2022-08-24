import 'package:dio/dio.dart';
import 'package:ecommerce_api/AirLine_App/models/passengerResponse.dart';

class AirLineDioHelper {
  AirLineDioHelper._();
  static AirLineDioHelper airLineDioHelper = AirLineDioHelper._();
  Dio dio = Dio();
  Future<PassengerResponse> getPassengers([int page = 0]) async {
    Response response = await dio
        .get('https://api.instantwebtools.net/v1/passenger', queryParameters: {
      'size': 10,
      'page': page,
    });
    PassengerResponse passengerResponse =
        PassengerResponse.fromJson(response.data);
    return passengerResponse;
  }
}
