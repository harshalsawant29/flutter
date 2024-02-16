import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: ((context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : Consumer<GreatPlaces>(
                    child: Center(
                      child: Text('Got no places yet'),
                    ),
                    builder: (context, greatPlaces, ch) =>
                        greatPlaces.items.length <= 0
                            ? ch
                            : ListView.builder(
                                itemCount: greatPlaces.items.length,
                                itemBuilder: (context, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(greatPlaces.items[i].image),
                                  ),
                                  title: Text(greatPlaces.items[i].title),
                                  onTap: () {
                                    //...go to detail screen
                                  },
                                ),
                              ),
                  )),
      ),
    );
  }
}
