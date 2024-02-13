import 'dart:developer';

import 'package:figma_pages/screens/job_screen.dart';
import 'package:figma_pages/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabOne extends StatefulWidget {
  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  var isSelectedTab1 = false;
  var isSelectedTab2 = false;
  var isSelectedTab3 = false;
  var isSelectedFilter1 = false;
  var isSelectedFilter2 = false;
  var isSelectedFilter3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 36,
                  width: 308,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(107, 71, 149, 1),
                        Color.fromRGBO(231, 49, 120, 1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 35,
                      width: 307,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 3,
                            left: 8,
                            bottom: 8,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                            color: Colors.pink,
                          ),
                          //focusColor: Colors.blue,
                          labelText: 'Job title, Skills, Designation',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                          border: InputBorder.none,
                        ),
                        autocorrect: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.purple,
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/images/locationPin.png'),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'City,Town',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  color: Colors.purple,
                  icon: Icon(Icons.my_location),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(107, 71, 149, 1),
                        Color.fromRGBO(231, 49, 120, 1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            isSelectedFilter1 ? Colors.purple : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSelectedFilter1 = !isSelectedFilter1;
                        });
                      },
                      child: Text(
                        'All',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: isSelectedFilter1
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(107, 71, 149, 1),
                        Color.fromRGBO(231, 49, 120, 1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            isSelectedFilter2 ? Colors.purple : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSelectedFilter2 = !isSelectedFilter2;
                        });
                      },
                      child: Text(
                        'Categories',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: isSelectedFilter2
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(107, 71, 149, 1),
                        Color.fromRGBO(231, 49, 120, 1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            isSelectedFilter3 ? Colors.purple : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSelectedFilter3 = !isSelectedFilter3;
                        });
                      },
                      child: Text(
                        'Easy Apply',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: isSelectedFilter3
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            JobCards(),
          ],
        ),
      ),
    );
  }
}
