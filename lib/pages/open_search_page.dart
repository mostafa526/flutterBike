import 'package:flutter/material.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/pages/edits_bike.dart';
import 'package:shiref_bike/pages/search.dart';
import 'package:shiref_bike/widgets/shared.dart';

class addd extends StatelessWidget {
  main_bike b;
  addd(context, main_bike b) {
    this.b = b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Search Results"),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 300,
            child: GridTile(
                child: Image.network(
              b.get_image(),
              fit: BoxFit.fill,
            )),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Details",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),

          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Model: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    b.get_model(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Description: ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextSpan(
                  text: b.get_description(),
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ]))),

          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Price: ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextSpan(
                  text: b.get_sell_price().toString(),
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ]))),
          //edit bike

          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Align(
              child: SizedBox(
                width: 250,
                height: 60,
                child: RaisedButton(
                  color: Colors.lightGreen[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "QR Scanner",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Align(
              child: SizedBox(
                width: 250,
                height: 60,
                child: RaisedButton(
                  color: Colors.lightGreen[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Delete Bike",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Align(
              child: SizedBox(
                width: 250,
                height: 60,
                child: RaisedButton(
                  color: Colors.lightGreen[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Edit Bike",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return edit_bike(this.b);
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
