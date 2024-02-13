import 'dart:developer';

import 'package:figma_pages/screens/home_screen.dart';
import 'package:figma_pages/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventScreen extends StatefulWidget {
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<String> featuredEventList = [
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
    'assets/images/event.png',
  ];

  Map<String, String> taskTextMap = {
    'assets/images/book.png': 'My Tasks',
    'assets/images/tags.png': 'My Offers',
    'assets/images/music.png': 'My Events',
    'assets/images/clipboard.png': 'Submission',
  };

  List<String> taskImagesList = [
    'assets/images/book.png',
    'assets/images/tags.png',
    'assets/images/music.png',
    'assets/images/clipboard.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Drawer(
          child: IconButton(
            color: Colors.purple,
            onPressed: () {
              Get.to(
                HomePage(),
              );
            },
            icon: ImageIcon(
              AssetImage('assets/images/drawer.png'),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Image.asset('assets/images/bell.png'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/picture.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 10),
                    child: Text(
                      'Featured Tasks',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baloo2(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, top: 10),
                    child: GestureDetector(
                      child: Text(
                        'VIEW ALL',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 128,
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 24),
                          height: 120,
                          width: 242,
                          //color: Colors.amber,
                          child: Container(
                            height: 120,
                            width: 242,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.purple,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Medium Level',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        color: Colors.purple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        'Lorem ipsum doler sit amet dolor site',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                    Text(
                                      '21 Jan 2022',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          child: Image.asset('assets/images/cardTag.png'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 120,
              // color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: taskImagesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 112,
                            width: 81,
                            padding: EdgeInsets.only(
                              top: 33,
                            ),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(21),
                                ),
                              ),
                              child: Container(
                                height: 112,
                                width: 81,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        taskTextMap['${taskImagesList[index]}'],
                                        softWrap: true,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.purple),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 35,
                            left: 12,
                            child: Image.asset(
                              taskImagesList[index],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 10),
                    child: Text(
                      'Featured Event',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baloo2(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, top: 10),
                    child: GestureDetector(
                      child: Text(
                        'VIEW ALL',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: featuredEventList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 233,
                      child: Image.asset(
                        featuredEventList[index],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}
