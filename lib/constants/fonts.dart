import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class TodoFonts {


  static TextStyle? bodyTextPrimary(BuildContext context) {
    return GoogleFonts.ubuntu(color: TodoColors.primaryColor, fontWeight: FontWeight.bold);
  }
  static TextStyle? bodyTextSecondary(BuildContext context) {
    return GoogleFonts.adamina(color: TodoColors.secondaryColor, fontWeight: FontWeight.bold);
  }
  static TextStyle? bodyTextWhite(BuildContext context) {
    return GoogleFonts.adamina(color: Colors.white, fontWeight: FontWeight.bold);
  }
}