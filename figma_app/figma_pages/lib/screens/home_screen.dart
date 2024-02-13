import 'dart:developer';

import 'package:figma_pages/screens/event_screen.dart';
import 'package:figma_pages/screens/offer_category_screen.dart';
import 'package:figma_pages/screens/internship_screen.dart';
import 'package:figma_pages/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  List<String> imageList = [
    'assets/images/food&drinks.png',
    'assets/images/electronics.png',
    'assets/images/fashion.png',
    'assets/images/travel.png',
    'assets/images/beauty&Health.png',
    'assets/images/entertainment.png',
    'assets/images/sport&Fittness.png',
    'assets/images/education.png',
  ];

  List<String> tittlList = [
    'Food & Drinks',
    'Electronics',
    'Fashion',
    'Travel',
    'Beauty & Health',
    'Entertainment',
    'Sport & Fittness',
    'Education',
  ];

  List<String> featuredList = [
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
    'assets/images/featured.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Offers',
          style: TextStyle(
              fontFamily: 'Baloo2',
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.black),
        ),
        actions: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    log('Clicked on location icon');
                  },
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.pink,
                    size: 14,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Baner',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Text(
                    'categories',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baloo2(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(22),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey.shade100,
                  child: Column(
                    children: [
                      Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => EventScreen(),
                          );
                        },
                        child: Text(
                          tittlList[index],
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                //mainAxisExtent: 10,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
            ),
            // SizedBox(
            //   height: 16.95,
            // ),
            Container(
              height: 17,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: FittedBox(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.expand_more,
                    color: Colors.grey,
                    size: 100,
                  ),
                  label: Text(
                    'show more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 10),
                    child: Text(
                      'Featured',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baloo2(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 27.0, top: 10),
                    child: GestureDetector(
                      child: Text(
                        'VIEW ALL',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(
                10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 1,
                childAspectRatio: 1,
              ),
              itemCount: featuredList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      10,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        featuredList[index],
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      log('clicked on featured grid');
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context),
    );
  }
}
