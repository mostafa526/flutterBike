import 'package:flutter/material.dart';
import 'package:shiref_bike/add_types/add_bike.dart';
import 'package:shiref_bike/add_types/add_user.dart';
//import 'package:shiref_bike/grocerry_kit/sub_pages/home_list.dart';
import 'package:shiref_bike/pages/actions.dart';
import 'package:shiref_bike/pages/add.dart';
import 'package:shiref_bike/pages/home.dart';
import 'package:shiref_bike/pages/login.dart';
import 'package:shiref_bike/pages/records.dart';
import 'package:shiref_bike/pages/search.dart';

import 'package:shiref_bike/widgets/shared.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
      //home: add_user(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 5,
            child: new Scaffold(
              body: TabBarView(
                children: [
                  home(),
                  add(),
                  search(),
                  actions(),
                  state_record(),
                ],
              ),
              bottomNavigationBar: new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.home),
                  ),
                  Tab(
                    icon: new Icon(Icons.add_box),
                  ),
                  Tab(
                    icon: new Icon(Icons.search),
                  ),
                  Tab(
                    icon: new Icon(Icons.work),
                  ),
                  Tab(
                    icon: new Icon(Icons.calendar_view_day),
                  )
                ],
                labelColor: Colors.lightGreen[500],
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.lightGreen[500],
              ),
              backgroundColor: Colors.grey[800],
            ),
          ),
        ));
  }
}
