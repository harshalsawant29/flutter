import 'package:flutter/material.dart';

class HeroDetails extends StatelessWidget {
  final String id;

  HeroDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Pratapgad',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Hero(
              tag: id,
              child: Image.network(
                  'https://www.shutterstock.com/image-photo/natureal-green-mountains-view-pratapgad-260nw-1496251019.jpg'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Text(
              'Description',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
