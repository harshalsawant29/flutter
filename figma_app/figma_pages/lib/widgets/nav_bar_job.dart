import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobNavBar extends StatelessWidget {
  JobNavBar(BuildContext context);

  @override
  Container build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(231, 49, 120, 1),
            Color.fromRGBO(137, 16, 63, 1),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: Colors.white,
              ),
              shape: StadiumBorder(),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {},
            icon: Icon(Icons.bookmark_border),
            label: Text(
              'Saved',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Easy Apply',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
