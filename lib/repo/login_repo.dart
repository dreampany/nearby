import 'package:shared_preferences/shared_preferences.dart';

import 'package:nearby/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-12-22
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginRepo {
  static LoginRepo instance;

  LoginRepo._internal();

  factory LoginRepo.of() {
    if (instance == null)
      instance = LoginRepo._internal();
    return instance;
  }

  Future<bool> loggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.Keys.LOGGED_IN) ?? false;
  }

  void setLoggedIn(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.Keys.LOGGED_IN, loggedIn);
  }


}