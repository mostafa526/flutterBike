import 'package:flutter/material.dart';
import 'package:shiref_bike/add_types/add_bike.dart';
import 'package:shiref_bike/add_types/add_product.dart';
import 'package:shiref_bike/add_types/add_service.dart';
import 'package:shiref_bike/add_types/add_user.dart';
import 'package:shiref_bike/widgets/shared.dart';

import '../main.dart';

class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: appBar('Add Categories'),
          body: GridView(
            padding: EdgeInsets.all(5),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              //add customer
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.person_add,
                          color: (Colors.grey[500]), size: 100),
                      Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return add_user();
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightGreen[300],
                                    Colors.lightGreen[500]
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 160.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Customer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //service
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.build, color: (Colors.grey[500]), size: 100),
                      Divider(
                        color: Colors.transparent,
                        thickness: 1,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return add_service();
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightGreen[300],
                                    Colors.lightGreen[500]
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 160.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Service",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //bike
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.directions_bike,
                          color: (Colors.grey[500]), size: 100),
                      Divider(
                        color: Colors.transparent,
                        thickness: 5,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return add_bike();
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightGreen[300],
                                    Colors.lightGreen[500]
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 160.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Bike",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //product
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.motorcycle,
                          color: (Colors.grey[500]), size: 100),
                      Divider(
                        color: Colors.transparent,
                        thickness: 5,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return add_product();
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightGreen[300],
                                    Colors.lightGreen[500]
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 160.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Product",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //event
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.event, color: (Colors.grey[500]), size: 100),
                      Divider(
                        color: Colors.transparent,
                        thickness: 5,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (BuildContext context) {
                            //   return add();
                            // }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightGreen[300],
                                    Colors.lightGreen[500]
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 160.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Event",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
          //ListView(
          //   padding: EdgeInsets.all(32),
          //   children: <Widget>[
          //     RaisedButton(
          //         color: Colors.blue,
          //         child: Text('Add Customer'),
          //         onPressed: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (BuildContext context) {
          //             return add_user();
          //           }));
          //         }),
          //     RaisedButton(
          //         color: Colors.blue,
          //         child: Text('Add Service'),
          //         onPressed: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (BuildContext context) {
          //             return add_service();
          //           }));
          //         }),
          //     RaisedButton(
          //         color: Colors.blue,
          //         child: Text('Add product'),
          //         onPressed: () => Navigator.of(context).push(
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return add_product();
          //             }))),
          //     RaisedButton(
          //         color: Colors.blue,
          //         child: Text('Add Bike'),
          //         onPressed: () => Navigator.of(context).push(
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return add_bike();
          //             }))),
          //     RaisedButton(
          //         color: Colors.blue,
          //         child: Text('Add Event'),
          //         onPressed: () => Navigator.of(context).push(
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return null;
          //             })))
          //   ],
          // ),
          ),
    );
  }
}
