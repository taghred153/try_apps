import 'package:flutter/cupertino.dart';
import 'package:try_apps/models/randomusermodel.dart';
import 'package:try_apps/services/randomuserservice.dart';

class RandomUserProvider extends ChangeNotifier{
  RandomUserModel? randomUserModel;

  Future<void> fetchdata() async {
    randomUserModel = await RandomUserService.getdata();
    notifyListeners();
  }
}