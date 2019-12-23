import 'package:nearby/login/login_event.dart';
import 'package:nearby/login/login_screen.dart';
import 'package:nearby/login/login_state.dart';
import 'package:bloc/bloc.dart';

/**
 * Created by roman on 2019-12-23
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithNameEvent) {
      yield LoginState.loading(false);
    } else if (event is LogoutEvent) {
      yield LoginState.loading(false);
    } else if (event is LoginEventInProgress) {
      yield LoginState.loading(true);
    } else if (event is LoginErrorEvent) {

    }
  }

  void setAuthListener(LoginWidget widget) {

  }
}