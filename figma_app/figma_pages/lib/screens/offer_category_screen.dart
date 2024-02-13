import 'package:figma_pages/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferCategory extends StatelessWidget {
  List<String> offersImage = [
    'assets/images/tacoBellLogo.png',
    'assets/images/burgerKingLogo.png',
    'assets/images/zomatoLogo.png',
    'assets/images/tacoBellLogo.png',
    'assets/images/burgerKingLogo.png',
    'assets/images/zomatoLogo.png',
    'assets/images/tacoBellLogo.png',
    'assets/images/burgerKingLogo.png',
    'assets/images/zomatoLogo.png',
  ];

  List<String> title = [
    'TACO BELL',
    'BURGER KING',
    'ZOMATO',
    'TACO BELL',
    'BURGER KING',
    'ZOMATO',
    'TACO BELL',
    'BURGER KING',
    'ZOMATO',
    'TACO BELL',
    'BURGER KING',
    'ZOMATO',
  ];

  List<String> rating = [
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
    'assets/images/star35.png',
  ];

  Map<String, String> titles = {
    'TACO BELL': 'Dine-in and Delivery',
    'BURGER KING': 'Dine-in',
    'ZOMATO': 'Delivery',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'Food & Drinks',
          style: GoogleFonts.baloo2(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: offersImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        17,
                      ),
                    ),
                    child: ListTile(
                      leading: Image(
                        height: double.infinity,
                        //fit: BoxFit.cover,
                        image: AssetImage(
                          offersImage[index],
                        ),
                      ),
                      title: Center(
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${title[index]}',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${titles['${title[index]}']}',
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600),
                            ),
                            Spacer(),
                            Text(
                              'Baner, Pune',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 24,
                            width: 98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: Colors.pink,
                            ),
                            child: Text(
                              'Get 30% off*',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 12,
                            width: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              border: Border.all(
                                color: Colors.pink,
                              ),
                            ),
                            child: SizedBox(
                              child: Image.asset(rating[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
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
