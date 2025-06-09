import 'package:dio/dio.dart';
import 'package:try_apps/models/registermodel.dart';

class RegisterService{
  static Dio dio = Dio();

  static Future<RegisterModel> signupservice({
    required String name,
    required String email,
    required String phone,
    required String password,
})async{
    try{
      Response response = await dio.post(
          "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
            "name": name,
            "email": email,
            "phone": phone,
            "password": password,
        });
      if (response.statusCode == 200){
        return RegisterModel.fromjaon(response.data);
      }
      else{
        throw Exception("error");
      }
    }
    catch(ex){
      throw Exception(ex);
    }
  }
  
  static Future<RegisterModel> loginservice({
    required String email,
    required String password,
})async{
    try{
      Response response = await dio.post(
          "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {
            "email": email,
            "password":password,
        });
      if (response.statusCode == 200) {
        return RegisterModel.fromjaon(response.data);
      }
      else{
        throw Exception("error");
      }
    }
    catch(ex){
      throw Exception(ex);
    }
  }
}