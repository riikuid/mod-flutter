import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient primaryGradient = const LinearGradient(
  colors: [Color(0xff6652ee), Color(0xffe04d6e)],
  stops: [0.2, 0.7],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient pinkGradient = const LinearGradient(
  colors: [Color(0xffd50616), Color(0xfff92394)],
  stops: [0.35, 0.75],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient blueGradient = const LinearGradient(
  colors: [Color(0xff211CFB), Color(0xff2EE9E8)],
  stops: [0.25, 0.85],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient blueGradientHorizontal = const LinearGradient(
  colors: [Color(0xff211CFB), Color(0xff2EE9E8)],
  stops: [0.25, 0.85],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

Color backgroundPrimary = const Color(0xFF202125);
Color backgroundSecondary = const Color(0xFF101010);
Color baseShadowGradient = const Color(0xFF04001F);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: Colors.white,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
