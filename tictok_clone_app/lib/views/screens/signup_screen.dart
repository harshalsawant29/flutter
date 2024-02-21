import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictok_clone_app/controllers/auth_controller.dart';
import 'package:tictok_clone_app/views/screens/login_screen.dart';

import '../../constants.dart';
import '../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        builder: (context, child) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TikTok',
                  style: GoogleFonts.roboto(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w900,
                    color: buttonColor,
                  ),
                ),
                Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwvdmtfCQZdwU9UKI82zd5yUZB1KDx5sWaxA&usqp=CAU'),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 40,
                      child: IconButton(
                        onPressed: () => authController.pickImage(),
                        icon: Icon(Icons.add_a_photo_rounded),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextInputField(
                    controller: _userNameController,
                    icon: Icons.person,
                    labelText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextInputField(
                    controller: _emailController,
                    icon: Icons.email,
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextInputField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    labelText: 'Password',
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: InkWell(
                    onTap: () => authController.registerUser(
                      _userNameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto,
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}
