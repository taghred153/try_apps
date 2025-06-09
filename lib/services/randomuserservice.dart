import 'package:dio/dio.dart';
import 'package:try_apps/models/randomusermodel.dart';

class RandomUserService{
  static Dio dio = Dio();

  static Future<RandomUserModel> getdata() async{
    try{
      Response response = await dio.get("https://randomuser.me/api/?results=10");
      if(response.statusCode == 200)
        {
          return RandomUserModel.fromjson(response.data);
        }
      else{
        throw Exception("error");
      }
    }
    catch(ex)
    {
      throw Exception(ex);
    }
  }
}