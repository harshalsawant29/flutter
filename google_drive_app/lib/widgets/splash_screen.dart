import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Center(
        child: Text(
          'Loading',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
