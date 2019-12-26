/**
 * Created by roman on 2019-12-26
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeState {
  final bool loading;
  HomeState._internal(this.loading);
  factory HomeState.initial() => HomeState._internal(false);
}