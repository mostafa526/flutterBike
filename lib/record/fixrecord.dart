import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:http/http.dart' as http;

class fix_record {
  List<fix_recordd> fix_records = [];

  fix_recod() {
    get_fix_record();
  }

  Future get_fix_record() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    // final admin = prefs.getString('admin') ?? 0;
    print(token);
    final http.Response response = await http.get(
      'http://nabilmokhtar.pythonanywhere.com/Records/FixRecords/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "token $token"
      },
    );
    print(response.statusCode);

    var josendata = json.decode(response.body);
    for (var i in josendata) {
      fix_recordd r = new fix_recordd(
        i["id"],
        i["customer"],
        i["price"],
        i["notes"],
        i["adminName"],
      );
      fix_records.add(r);
    }
  }
}

class fix_recordd {
  int _id;
  int _customer;
  int _price;

  String _notes;
  String _admin_name;

  fix_recordd(
    this._id,
    this._customer,
    this._price,
    this._notes,
    this._admin_name,
  );

  int get_id() {
    return _id;
  }

  int get_customer() {
    return _customer;
  }

  String get_notes() {
    return _notes;
  }

  String get_admin_name() {
    return _admin_name;
  }

  int get_price() {
    return _price;
  }
}
