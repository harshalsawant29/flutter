import 'package:figma_pages/widgets/nav_bar_job.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(
                10,
              ),
              width: 250,
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '5 Openings',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '200 Applications',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(
                10,
              ),
              width: 250,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Apply By:',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '  12 March 2022',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 41,
              width: 381,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 156, 222, 1),
                    Color.fromRGBO(231, 49, 120, 1),
                  ],
                ),
                // borderRadius: BorderRadius.circular(
                //   40,
                //),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Container(
                height: 40,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  height: 25,
                  width: 310,
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Job Description',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '  ( 6 months Full-time )',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 27,
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Row(
                children: [
                  Text(
                    'Stipend',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '    12000/- per month.',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 185,
              //width: 328,
              padding: EdgeInsets.all(10),
              child: Text(
                'As the purveyor of entertainment, BoShow enables your event with end to end solutions from the time you register to the completion of the event. Let’s look at what you can host. bles your event with end to end solutions from the time you register to the completion of the event. Let’s look at what youbles your event with end to end solutions from the time you ',
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            Container(
              height: 41,
              width: 381,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 156, 222, 1),
                    Color.fromRGBO(231, 49, 120, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Container(
                height: 40,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  height: 25,
                  width: 310,
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Who can apply : ',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'As the purveyor of entertainment, BoShow enables your event with end to end so',
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            Container(
              height: 102,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'As the purveyor of entertainment, BoShow enables your event with end to end so veyor of entertainment, BoShow enables your event with end t',
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: JobNavBar(context),
    );
  }
}
