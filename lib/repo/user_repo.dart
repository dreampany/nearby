import 'package:nearby/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nearby/misc/constants.dart' as Constants;
/**
 * Created by roman on 2019-12-24
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class UserRepo {
  static UserRepo instance;

  UserRepo._internal();

  factory UserRepo.of() {
    if (instance == null) instance = UserRepo._internal();
    return instance;
  }

  Future<User> currentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString(Constants.Keys.ID);
    String name = prefs.getString(Constants.Keys.NAME);
    int time = prefs.getInt(Constants.Keys.TIME);
    if (id == null || name == null) return null;
    return User(id, name, time: time);
  }

  void setCurrentUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.Keys.ID, user.id)
        .then((value) => prefs.setString(Constants.Keys.NAME, user.name))
        .then((value) => prefs.setInt(Constants.Keys.TIME, user.time));
  }
}