import 'package:dio/dio.dart';
import 'package:try_apps/models/weathermodel.dart';

class WeatherService{
  static Dio dio = Dio();

  static Future<WeatherModel> getdata() async{
    try{
      Response response = await dio.get(
          "https://elsewedyteam.runasp.net/api/Country/GetCountries"
      );
      if(response.statusCode == 200)
        {
          return WeatherModel.fromjson(response.data);
        }
      else
        {
          throw Exception("error");
        }
    }
    catch(ex)
    {
      throw Exception(ex);
    }
  }
}