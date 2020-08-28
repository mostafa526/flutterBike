import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:http/http.dart' as http;

class user {
  int _id;

  String _name;
  int _phone;
  String _id_image;
  String _user_image;
  String _address;

  user(
    this._id,
    this._name,
    this._phone,
    this._address,
    this._id_image,
    this._user_image,
  );

  int get_id() {
    return _id;
  }

  String get_name() {
    return _name;
  }

  int get_phone() {
    return _phone;
  }

  String get_address() {
    return _address;
  }

  String get_user_image() {
    return _user_image;
  }

  String get_id_image() {
    return _id_image;
  }
}
