import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLoaction() async {
    final locData = await Location().getLocation();
    log('${locData.latitude}');
    log('${locData.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor),
              onPressed: _getCurrentUserLoaction,
            ),
            TextButton.icon(
                icon: Icon(Icons.map),
                label: Text('Select on Map'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
