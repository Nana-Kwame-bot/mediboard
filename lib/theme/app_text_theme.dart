import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTextTheme {
  static TextTheme get textTheme {
    return TextTheme(
      // styleName: xs/lg/Semibold
      displayLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.56,
      ),
      // styleName: xs/Regular
      bodyLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.14,
      ),
      // styleName: xs/sm/Regular
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.33,
      ),
      // styleName: xs/sm/Bold
      titleMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        height: 1.33,
      ),
      // styleName: xs/Semibold
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.14,
      ),
      // styleName: xs/Bold
      displayMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.14,
      ),
    );
  }
}
