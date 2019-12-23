/**
 * Created by roman on 2019-12-23
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
abstract class LoginEvent {}
class LoginWithNameEvent extends LoginEvent {}
class LogoutEvent extends LoginEvent {}
class LoginEventInProgress extends LoginEvent {}
class LoginErrorEvent extends LoginEvent {
  final dynamic error;
  LoginErrorEvent(this.error);
}

