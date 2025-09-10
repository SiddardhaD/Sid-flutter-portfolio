import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';

class TextStyling {
  TextStyle userName = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  TextStyle userRole = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  TextStyle siderheading = GoogleFonts.poppins(
    color: AppConstats.quickSilver,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
  TextStyle siderAnswer = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
