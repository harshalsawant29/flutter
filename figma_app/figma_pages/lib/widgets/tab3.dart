import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Saved Screen',
          style: GoogleFonts.baloo2(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
