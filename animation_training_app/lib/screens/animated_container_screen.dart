import 'package:animation_training_app/screens/animated_align_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedContainerScreen extends StatefulWidget {
  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  var tapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Animated Container',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                tapped = !tapped;
              });
            },
            child: Center(
              child: AnimatedContainer(
                padding: EdgeInsets.all(2),
                duration: Duration(seconds: 2),
                width: tapped ? 250 : 100,
                height: tapped ? 350 : 100,
                color: tapped ? Colors.amber : Colors.red,
                curve: Curves.fastOutSlowIn,
                child: tapped
                    ? FlutterLogo(
                        size: 100,
                      )
                    : Text('Click to see Flutter Logo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.to(
                () => AnimatedAlignScreen(),
              );
            },
            label: Text('Animated Align'),
          ),
        ],
      ),
    );
  }
}
