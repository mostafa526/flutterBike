import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: Colors.grey[800],
    leading: Icon(
      Icons.directions_bike,
      color: Colors.white,
      size: 30,
    ),
    title: Text(
      '$title',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.lightGreen[500],
            size: 30,
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            SystemNavigator.pop();
          })
    ],
  );
}
