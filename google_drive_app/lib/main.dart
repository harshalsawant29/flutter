import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import './user_screen.dart';
import 'controllers/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserFunctions controller = Get.put(UserFunctions());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/images/BI.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Drive App Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.Google,
                text: 'Sign in with Google',
                onPressed: () async {
                  await controller.loginWithGoogle();
                  if (controller.isLoggedIn) {
                    Get.to(
                      () => UserScreen(),
                    );
                  }
                  return;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
