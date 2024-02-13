import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/job_screen.dart';

class JobCards extends StatefulWidget {
  @override
  State<JobCards> createState() => _JobCardsState();
}

class _JobCardsState extends State<JobCards> {
  List<String> iconList = [
    'assets/images/itone.png',
    'assets/images/procode.png',
    'assets/images/ascend.png',
    'assets/images/fedex.png',
    'assets/images/itone.png'
  ];

  var isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: iconList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 13,
                    ),
                    height: 108,
                    width: 320,
                    child: GestureDetector(
                      onTap: () {
                        log('Clicked on job card');
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Container(
                          height: 108,
                          width: 306,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'UI / UX Designer',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Icons.bookmark_border,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            onTap: () {
                                              //.
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Company Name',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Pune',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 63,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          color:
                                              Color.fromRGBO(224, 246, 255, 1),
                                        ),
                                        child: Text(
                                          'Easy Apply',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                              0,
                                              156,
                                              222,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '2d ago',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade700,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 17,
                    child: GestureDetector(
                      child: Image.asset(
                        iconList[index],
                      ),
                      onTap: () {
                        Get.to(
                          () => JobScreen(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
