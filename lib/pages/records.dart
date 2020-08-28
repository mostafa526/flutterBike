import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shiref_bike/record/fixrecord.dart';
import 'package:shiref_bike/record/rentrecord.dart';
import 'package:shiref_bike/record/sellrecord.dart';
import 'package:shiref_bike/result_data/fix_record_data.dart';
import 'package:shiref_bike/result_data/rent_record_data.dart';
import 'package:shiref_bike/result_data/sell_record_data.dart';

import 'edits_bike.dart';
import 'home.dart';

class state_record extends StatelessWidget {
  fix_record fix = new fix_record();
  sell_record sell = new sell_record();
  rent_record rent = new rent_record();
  search_for_bike b = new search_for_bike();
  get_user_data u = new get_user_data();

  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: fix.fix_records.length +
              sell.sell_records.length +
              rent.rent_records.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    if (index < rent.rent_records.length) {
      var recod = rent.rent_records[index];
      return new GestureDetector(
        onTap: () {
          b.search(recod.get_main_bike());
          u.search(recod.get_customer());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return rented_record(recod, b.b, u.get_user());
          }));
        },
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Icon(Icons.remove_shopping_cart),
                      Text(
                        "Process type:Rent",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Text(
                        "Admin Name: ${recod.get_admin_name()}",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Icon(Icons.contacts),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                          "Price:${recod.get_price().toString()}",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Icon(Icons.attach_money),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Text(
                          "End Date:${recod.get_ends()}",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Spacer(),
                        Icon(Icons.date_range),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else if (index >= rent.rent_records.length &&
        index < rent.rent_records.length + sell.sell_records.length) {
      var recod = sell.sell_records[index - rent.rent_records.length];

      return new GestureDetector(
        onTap: () {
          u.search(recod.get_customer());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return selled_record(recod, u.get_user());
          }));
        },
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text(
                        "Process type:SELL",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Text(
                        "Admin Name:${recod.get_admin_name()}",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Icon(Icons.contacts),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                          "Price :${recod.get_price().toString()}",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Icon(Icons.attach_money),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Text(
                          "Date:${recod.get_datatime().substring(0, 10)}",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Spacer(),
                        Icon(Icons.date_range),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else if (index >= rent.rent_records.length + sell.sell_records.length &&
        index <
            rent.rent_records.length +
                sell.sell_records.length +
                fix.fix_records.length) {
      var recod = fix.fix_records[
          index - sell.sell_records.length - rent.rent_records.length];
      return new GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return fixed_record(recod);
          }));
        },
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Icon(Icons.build),
                      Text(
                        "Process type:Fix",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Text(
                        "Admin Name:${recod.get_admin_name()}",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Spacer(),
                      Icon(Icons.contacts),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Price:${recod.get_price().toString()}",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Icon(Icons.attach_money),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
