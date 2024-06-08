import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme({
    required this.largeTitleRegular,
    required this.headline2Regular,
    required this.headline1Regular,
    required this.subtitle1Regular,
    required this.subtitle2Regular,
    required this.body1Regular,
    required this.body2Regular,
    required this.buttonRegular,
    required this.captionRegular,
    required this.overLineRegular,
    required this.body2Medium,
    required this.largeTitleBold,
    required this.headline2Bold,
    required this.headline1Bold,
    required this.body1Bold,
    required this.body2Bold,
    required this.buttonBold,
    required this.captionBold,
    required this.overLineBold,
  });

  factory AppTextTheme.defaultTextTheme() => AppTextTheme(
        largeTitleRegular: GoogleFonts.getFont('Montserrat', fontSize: 32),
        headline2Regular: GoogleFonts.getFont('Montserrat', fontSize: 24),
        headline1Regular: GoogleFonts.getFont('Montserrat', fontSize: 20, fontWeight: FontWeight.w500),
        subtitle1Regular: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
        subtitle2Regular: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
        body1Regular: GoogleFonts.getFont('Montserrat', fontSize: 16),
        body2Regular: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w400),
        buttonRegular: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
        captionRegular: GoogleFonts.getFont('Montserrat', fontSize: 12),
        overLineRegular: GoogleFonts.getFont('Montserrat', fontSize: 10),
        body2Medium: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
        largeTitleBold: GoogleFonts.getFont('Montserrat', fontSize: 32, fontWeight: FontWeight.w700),
        headline2Bold: GoogleFonts.getFont('Montserrat', fontSize: 24, fontWeight: FontWeight.w700),
        headline1Bold: GoogleFonts.getFont('Montserrat', fontSize: 20, fontWeight: FontWeight.w600),
        body1Bold: GoogleFonts.getFont('Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
        body2Bold: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w700),
        buttonBold: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w700),
        captionBold: GoogleFonts.getFont('Montserrat', fontSize: 12, fontWeight: FontWeight.w600),
        overLineBold: GoogleFonts.getFont('Montserrat', fontSize: 10, fontWeight: FontWeight.w600),
      );

  final TextStyle largeTitleRegular;
  final TextStyle headline2Regular;
  final TextStyle headline1Regular;
  final TextStyle subtitle1Regular;
  final TextStyle subtitle2Regular;
  final TextStyle body1Regular;
  final TextStyle body2Regular;
  final TextStyle buttonRegular;
  final TextStyle captionRegular;
  final TextStyle overLineRegular;

  final TextStyle body2Medium;

  final TextStyle largeTitleBold;
  final TextStyle headline2Bold;
  final TextStyle headline1Bold;
  final TextStyle body1Bold;
  final TextStyle body2Bold;
  final TextStyle buttonBold;
  final TextStyle captionBold;
  final TextStyle overLineBold;

  static AppTextTheme of(BuildContext context) => AppTheme.of(context).appTextTheme;
}
