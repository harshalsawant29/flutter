import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.bookmark,
      color: Colors.grey,
      size: 20,
    );
  }
}
