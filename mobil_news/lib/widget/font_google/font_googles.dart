import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textes extends StatelessWidget {

  final String text;
  const Textes({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(),);
  }
}