import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle routeTitleStyle = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 51, 50, 50)
  );

  static TextStyle routeSubtitleStyle = GoogleFonts.montserrat(
    fontSize: 16.0,
    //fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 194, 194, 194)
  );

  static TextStyle appBarTitleStyle = GoogleFonts.montserrat(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}