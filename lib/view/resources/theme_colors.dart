import 'dart:ui';

import 'package:flutter/widgets.dart';

abstract class ThemeColors {

  static const accent = Color(0xFFFF8400);

  static const white = Color(0xFFFFFFFF);

  static const grey = Color(0xFF949494);

  static const backgroundColor = Color(0xFFEEF3FC);

  static const scaffoldBackgroundColor = Color(0xFFF8F8F8);

  static const shadowColor = Color(0x16000000);

  static const torchRedGradient = LinearGradient(
    colors: [Color(0xFFFF0844), Color(0xFFFFB199)],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter
  );

  static const dodgerBlueGradient = LinearGradient(
    colors: [Color(0xFF2AF598), Color(0xFF009EFD)],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter
  );

  static const slateBlueGradient = LinearGradient(
    colors: [Color(0xFF3D4E81), Color(0xFF5753C9), Color(0xFF6E7FF3)],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter
  );

  static const primaryGradient = LinearGradient(
      colors: [const Color(0xFFFF8300), const Color(0xFFE8670A)]
  );

  static const progressBarGradient = LinearGradient(
      colors: [const Color(0xFFFd8A11), const Color(0xFFE8670A)]
  );
}
