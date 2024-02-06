import 'package:animation_training_app/screens/animated_align_screen.dart';
import 'package:animation_training_app/screens/animated_builder_creen.dart';
import 'package:animation_training_app/screens/animated_container_screen.dart';
import 'package:animation_training_app/screens/animated_opacity_screen.dart';
import 'package:animation_training_app/screens/animated_positioned_screen.dart';
import 'package:animation_training_app/screens/animated_size_screen.dart';
import 'package:animation_training_app/screens/animation_controller_screen.dart';
import 'package:animation_training_app/screens/hero_animation_screen.dart';
import 'package:animation_training_app/screens/homeScreen.dart';
import 'package:animation_training_app/screens/stagger_list_animation_screen.dart';
import 'package:animation_training_app/screens/tween_animation_builder_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text('Menu'),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Get.back();
                Get.to(
                  () => HomeScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Size'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedSizeScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Positioned'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedPPositionedScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Container'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedContainerScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Align'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedAlignScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Opacity'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedOpacityScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animated Builder'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimatedBuilderScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Tween Animation Builder'),
              onTap: () {
                Get.back();
                Get.to(
                  () => TweenAnimationBuilderScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Hero Animation'),
              onTap: () {
                Get.back();
                Get.to(
                  () => HeroAnimationScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Animation Controller'),
              onTap: () {
                Get.back();
                Get.to(
                  () => AnimationControllerScreen(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text('Stagger List'),
              onTap: () {
                Get.back();
                Get.to(
                  () => StaggerList(),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
