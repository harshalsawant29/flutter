import 'dart:io';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savedPlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              onPressed: _savedPlace,
              style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor:
                      Theme.of(context).primaryColor) // ButtonStyle(
              //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
        ],
      ),
    );
  }
}
