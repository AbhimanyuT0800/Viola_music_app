import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text onBoardingText({required String text}) {
  return Text(
    text,
    style: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
  );
}
