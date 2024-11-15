import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class KeyboardUtil{
  static void hideKeyboard(BuildContext context)
  {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if(!currentFocus.hasPrimaryFocus)
      {
        currentFocus.unfocus();
      }
  }
}
