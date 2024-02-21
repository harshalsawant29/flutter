import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictok_clone_app/constants.dart';
import 'package:tictok_clone_app/controllers/auth_controller.dart';
import 'package:tictok_clone_app/controllers/search_controller.dart';

import '../../models/user.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: searchController.searchedUsers.length,
              itemBuilder: (context, index) {
                User user = searchController.searchedUsers[index];
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePhoto),
                    ),
                    title: Text(
                      user.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
