import 'package:figma_pages/widgets/rating_card.dart';
import 'package:flutter/material.dart';

class RatingTab extends StatelessWidget {
  List<Widget> ratingCardList = [
    RatingCard(),
    Divider(thickness: 1),
    RatingCard(),
    Divider(thickness: 1),
    RatingCard(),
    Divider(thickness: 1),
    RatingCard(),
    Divider(thickness: 1),
    RatingCard(),
    Divider(thickness: 1),
    RatingCard(),
    Divider(thickness: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: ratingCardList.length,
              itemBuilder: (context, index) {
                return ratingCardList[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}
