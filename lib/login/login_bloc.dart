import 'package:flutter/cupertino.dart';
import 'package:nearby/login/login_event.dart';
import 'package:nearby/login/login_screen.dart';
import 'package:nearby/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:nearby/misc/constants.dart' as Constants;
import 'package:nearby/model/user.dart';
import 'package:nearby/repo/login_repo.dart';
import 'package:nearby/repo/user_repo.dart';

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

  void loginOnUser(BuildContext context, String name, void Function(bool) callback) async {
    Constants.logger.d("LOGIN loginOnGoogle");
    add(LoginEventInProgress());
    final String id = await Constants.Api.getId(context);
    Constants.logger.d("LOGIN User ID "+ id);
    final User user = User(id, name, time: DateTime.now().millisecondsSinceEpoch);
    Constants.logger.d("LOGIN user " + user.name);
    UserRepo.of().setCurrentUser(user);
    LoginRepo.of().setLoggedIn(true);
    callback(true);

    /*final google = GoogleSignIn(scopes: [Constants.Keys.PROFILE, Constants.Keys.EMAIL]);
    final account = await google.signIn();
    if (account == null) {
      Constants.logger.d("LOGIN Account Not Found");
      add(LogoutEvent());
    } else {
      Constants.logger.d("LOGIN Account " + account.displayName);
      LoginRepo.of().signInWithGoogle(account);
    }*/
  }
}