import 'package:animation_training_app/screens/animation_controller_screen.dart';
import 'package:animation_training_app/widgets/hero_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroAnimationScreen extends StatefulWidget {
  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends State<HeroAnimationScreen> {
  String id = "networkImage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Hero Animation'),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-photo/natureal-green-mountains-view-pratapgad-260nw-1496251019.jpg'),
              child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: id,
                    child: Image.network(
                        'https://www.shutterstock.com/image-photo/natureal-green-mountains-view-pratapgad-260nw-1496251019.jpg'),
                  ),
                ),
                onTap: () {
                  Get.to(HeroDetails(id));
                },
              ),
            ),
            title: Text('Pratapgad Fort'),
          ),
          Divider(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.to(
                () => AnimationControllerScreen(),
              );
            },
            icon: Icon(Icons.arrow_forward),
            label: Text('Animation Controller'),
          ),
        ],
      ),
    );
  }
}
