import 'package:figma_pages/widgets/company_tab.dart';
import 'package:figma_pages/widgets/job_tab.dart';
import 'package:figma_pages/widgets/rating_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/tab1.dart';

class JobScreen extends StatefulWidget {
  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/sliverImage.png',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 106,
                        right: 106,
                        child: Container(
                          height: 200,
                          width: 150,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/itone.png',
                              ),
                              Text(
                                'UI/ Ux Designer',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Itone services Pvt.Ltd',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                'Apparel & Clothing',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Spacer(),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/locationPin.png'),
                                    ),
                                  ),
                                ),
                                label: Text(
                                  'Pune',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
                //toolbarHeight: 1,
                //collapsedHeight: 100,
                bottom: TabBar(
                  labelColor: Colors.pink,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                        'Job',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Company',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Rating',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              JobTab(),
              CompanyTab(),
              RatingTab(),
            ],
          ),
        ),
      ),
    );
  }
}
