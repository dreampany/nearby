import 'package:bloc/bloc.dart';
import 'package:nearby/home/home_event.dart';
import 'package:nearby/home/home_state.dart';

/**
 * Created by roman on 2019-12-26
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState {
    return HomeState.initial();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    return null;
  }
}