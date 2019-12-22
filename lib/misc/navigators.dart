import 'package:flutter/material.dart';

/**
 * Created by roman on 2019-12-22
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class Navigators {

  static void navigate(BuildContext context, String screen) {
    Navigator.of(context).pushReplacementNamed(screen);
  }

}