import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animated_opacity_screen.dart';

class AnimatedAlignScreen extends StatefulWidget {
  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Animated Align',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 4.5,
          //),
          Center(
            child: Container(
              color: Colors.amber,
              width: 300,
              height: 300,
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.to(
                () => AnimatedOpacityScreen(),
              );
            },
            label: Text('Animated Opacity'),
          ),
        ],
      ),
    );
  }
}
