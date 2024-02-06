import 'package:animation_training_app/screens/animated_container_screen.dart';
import 'package:animation_training_app/screens/animated_size_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedPPositionedScreen extends StatefulWidget {
  @override
  State<AnimatedPPositionedScreen> createState() =>
      _AnimatedPPositionedScreenState();
}

class _AnimatedPPositionedScreenState extends State<AnimatedPPositionedScreen> {
  var play = false;

  void changePosition() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Animated Positioned',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 400,
                    left: 58,
                    child: Text('Click play button to see the Message!'),
                  ),
                  AnimatedPositioned(
                    height: play ? MediaQuery.of(context).size.height / 1.5 : 0,
                    //width: 0,
                    left: 0,
                    right: 0,
                    curve: Curves.easeInOut,
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            'Hello',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    duration: Duration(seconds: 1),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Get.to(
                  () => AnimatedContainerScreen(),
                );
              },
              label: Text('Animated Container page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            play = !play;
          });
        },
        child: Icon(Icons.play_arrow),
        tooltip: "Click to toggle message",
      ),
    );
  }
}
