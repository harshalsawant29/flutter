import 'package:figma_pages/screens/home_screen.dart';
import 'package:figma_pages/screens/internship_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar(BuildContext context);

  @override
  Container build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(231, 49, 120, 1),
            Color.fromRGBO(74, 49, 104, 1),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20.0,
          ),
          topRight: Radius.circular(
            20.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/wallet.png'),
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Get.offAll(
                () => HomePage(),
              );
            },
            icon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/images/chat.png'),
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Get.to(
                () => InternshipScreen(),
              );
            },
            icon: ImageIcon(
              AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
    );
  }
}
