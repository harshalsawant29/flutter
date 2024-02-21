import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_clone_app/controllers/auth_controller.dart';
import 'package:tictok_clone_app/controllers/profile_controller.dart';
import 'package:tictok_clone_app/views/screens/add_video_screen.dart';
import 'package:tictok_clone_app/views/screens/message_screen.dart';
import 'package:tictok_clone_app/views/screens/profile_screen.dart';
import 'package:tictok_clone_app/views/screens/search_screen.dart';
import 'package:tictok_clone_app/views/screens/video_screen.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  MessageScreen(),
  ProfileScreen(uid: authController.user.uid),
];

//Colors

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//Controller
var authController = AuthController.instance;
