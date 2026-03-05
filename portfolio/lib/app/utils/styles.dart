import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';

class TextStyling {
  TextStyle userName = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 18,
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
  TextStyle mainTitle = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  TextStyle titleNamesStyle = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  TextStyle aboutMe = GoogleFonts.poppins(
    color: AppConstats.lotion,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  TextStyle careerFonts = GoogleFonts.inconsolata(
    color: AppConstats.lotion,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}

class Decorations {
  Decoration mainContainer = BoxDecoration(
    color: AppConstats.eerieBlack,
    border: Border(
      top: BorderSide(color: AppConstats.onyx, width: 2),
      left: BorderSide(color: AppConstats.onyx, width: 2),
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );
}
