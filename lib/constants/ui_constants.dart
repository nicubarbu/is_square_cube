import 'package:flutter/material.dart';

import 'constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text(AppWriteConstants.appBarText,
      textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
      centerTitle: true,
    );
  }
}
