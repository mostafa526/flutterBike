import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:http/http.dart' as http;

class sell_record {
  List<sell_recordd> sell_records = [];
  sell_record() {
    get_sell_record();
  }

  Future get_sell_record() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    // final admin = prefs.getString('admin') ?? 0;
    print(token);
    final http.Response response = await http.get(
      'http://nabilmokhtar.pythonanywhere.com/Records/SellRecord/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "token $token"
      },
    );

    print(response.statusCode);

    var josendata = json.decode(response.body);
    for (var i in josendata) {
      sell_recordd r = new sell_recordd(
        i['id'],
        i['customer'],
        i['price'],
        i['product'],
        i['dateTime'],
        i['notes'],
        i['adminName'],
      );

      sell_records.add(r);
    }
  }
}

class sell_recordd {
  int _id;
  int _customer;
  int _price;
  String _product;
  String _datetime;

  String _notes;
  String _admin_name;

  sell_recordd(
    this._id,
    this._customer,
    this._price,
    this._product,
    this._datetime,
    this._notes,
    this._admin_name,
  );

  int get_id() {
    return _id;
  }

  int get_customer() {
    return _customer;
  }

  int get_price() {
    return _price;
  }

  String get_product() {
    return _product;
  }

  String get_notes() {
    return _notes;
  }

  String get_admin_name() {
    return _admin_name;
  }

  String get_datatime() {
    return _datetime;
  }
}
