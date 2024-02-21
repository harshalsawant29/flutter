import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictok_clone_app/constants.dart';
import 'package:tictok_clone_app/views/screens/signup_screen.dart';
import 'package:tictok_clone_app/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
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
                    onTap: () => authController.loginUser(
                      _emailController.text,
                      _passwordController.text,
                    ),
                    child: Center(
                      child: Text(
                        'Login',
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
                      'Don\'t have an account ? ',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        'Register',
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
  }
}
