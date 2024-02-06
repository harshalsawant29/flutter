import 'dart:math';

import 'package:animation_training_app/screens/stagger_list_animation_screen.dart';
import 'package:animation_training_app/widgets/favoriteToggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerScreen extends StatefulWidget {
  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  var isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_controller);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 30,
            end: 50,
          ),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 50,
            end: 30,
          ),
          weight: 50),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Animation Controller'),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-photo/natureal-green-mountains-view-pratapgad-260nw-1496251019.jpg'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: '',
                  child: Image.network(
                      'https://www.shutterstock.com/image-photo/natureal-green-mountains-view-pratapgad-260nw-1496251019.jpg'),
                ),
              ),
            ),
            title: Text('Pratapgad Fort'),
            trailing: Container(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return IconButton(
                    color: _colorAnimation.value,
                    onPressed: () {
                      isFav ? _controller.reverse() : _controller.forward();
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: _sizeAnimation.value,
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.to(
                () => StaggerList(),
              );
            },
            icon: Icon(Icons.arrow_forward),
            label: Text('Stagger List Animation'),
          ),
        ],
      ),
    );
  }
}
