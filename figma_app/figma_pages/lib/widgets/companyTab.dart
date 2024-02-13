import 'package:figma_pages/widgets/nav_bar_job.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 300,
                child: Text(
                  'About Company',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 175,
                width: 328,
                child: Text(
                  'As the purveyor of entertainment, BoShow enables your event with end to end solutions from the time you register to the completion of the event. Let’s look at what you can host. bles your event with end to end solutions from the time you register to the completion of the event. Let’s look at what youbles your event with end to end solutions from the time you ',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 290,
                child: Row(
                  children: [
                    Text(
                      'Visit Here : ',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/images/globe.png'),
                      ),
                      color: Colors.blue,
                    ),
                    Text(
                      'www.websitelink.com',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 65,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Checkout us :',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Image(
                      image: AssetImage('assets/images/insta.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: JobNavBar(context),
    );
  }
}
