import 'package:dio/dio.dart';
import 'package:ecommerce_api/AirLine_App/models/passengerResponse.dart';
import 'package:ecommerce_api/Developer_app/profile_responce.dart';

class DeveloperDioHelper {
  DeveloperDioHelper._();
  static DeveloperDioHelper developerDioHelper = DeveloperDioHelper._();
  Dio dio = Dio();
  Future<ProfileResponce> getAllProfile() async {
    Response response = await dio
        .get('https://developer-connector-sami.herokuapp.com/api/profile');

    ProfileResponce profileResponce = ProfileResponce.fromJson(response.data);
    return profileResponce;
  }
}
