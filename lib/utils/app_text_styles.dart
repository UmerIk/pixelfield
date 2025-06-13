import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{
  static TextStyle lato({TextStyle? style}){
    return GoogleFonts.lato(
      textStyle: style
    );
  }


  static TextStyle ebGaramond({TextStyle? style}){
    return GoogleFonts.ebGaramond(
        textStyle: style
    );
  }
}