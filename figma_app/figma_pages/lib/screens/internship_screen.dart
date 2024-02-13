import 'package:figma_pages/widgets/tab1.dart';
import 'package:figma_pages/widgets/tab2.dart';
import 'package:figma_pages/widgets/tab3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternshipScreen extends StatefulWidget {
  @override
  State<InternshipScreen> createState() => _InternshipScreenState();
}

class _InternshipScreenState extends State<InternshipScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            'Internships',
            style: GoogleFonts.baloo2(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey.shade600,
            tabs: [
              Tab(
                child: Text(
                  'Search',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Applied',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: GestureDetector(
                  child: Text(
                    'Saved',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabOne(),
            TabTwo(),
            TabThree(),
          ],
        ),
      ),
    );
  }
}
