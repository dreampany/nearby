import 'package:nearby/model/user.dart';

/**
 * Created by roman on 2019-12-24
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
abstract class LoginResponse {}
class LoginFailedResponse extends LoginResponse {
  final String error;
  LoginFailedResponse(this.error);
}

class LoginSuccessResponse extends LoginResponse {
  final User user;
  LoginSuccessResponse(this.user);
}