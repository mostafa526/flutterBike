import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:http/http.dart' as http;

class rent_record {
  List<rent_recordd> rent_records = [];
  main_bike k;
  rent_record() {
    get_rent_record();
  }
  Future get_rent_record() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    // final admin = prefs.getString('admin') ?? 0;
    print(token);
    final http.Response response = await http.get(
      'http://nabilmokhtar.pythonanywhere.com/Records/RentRecords/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "token $token"
      },
    );

    print(response.statusCode);

    var josendata = json.decode(response.body);
    for (var i in josendata) {
      rent_recordd r = new rent_recordd(
        i["id"],
        i["customer"],
        i["bike"],
        i["status"],
        i["ends"],
        i["note"],
        i["price"],
        i["adminName"],
      );
      rent_records.add(r);
    }
  }
}

class rent_recordd {
  int _id;
  int _customer;
  int _bike;
  bool _status;
  String _ends;
  String _notes;
  int _price;
  String admin_name;
  rent_recordd(
    this._id,
    this._customer,
    this._bike,
    this._status,
    this._ends,
    this._notes,
    this._price,
    this.admin_name,
  );

  int get_id() {
    return _id;
  }

  int get_customer() {
    return _customer;
  }

  int get_main_bike() {
    return _bike;
  }

  bool get_satus() {
    return _status;
  }

  String get_ends() {
    return _ends;
  }

  String get_notes() {
    return _notes;
  }

  String get_admin_name() {
    return admin_name;
  }

  int get_price() {
    return _price;
  }
}
