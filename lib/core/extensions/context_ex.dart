import 'package:flutter/material.dart';

extension contextExtension on BuildContext {
  double get getWidth {
    return MediaQuery.sizeOf(this).width;
  }
  double get  getheight {
    return MediaQuery.sizeOf(this).height;
  }
}
