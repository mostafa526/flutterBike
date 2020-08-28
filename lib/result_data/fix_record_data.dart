import 'package:flutter/material.dart';
import 'package:shiref_bike/record/fixrecord.dart';

class fixed_record extends StatelessWidget {
  final fix_recordd k;
  fixed_record(this.k);

  final _formkey = GlobalKey<FormState>();

  Widget _notes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_notes()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'notes',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _price_fix() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_price().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'price of fix',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _customer_data() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_customer().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'customer',
        ),
        maxLines: 2,
      ),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();
  final rentholder = TextEditingController();
  final priceholder = TextEditingController();

  Widget _admin_name() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_admin_name()),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'admin name',
            icon: Icon(
              Icons.directions_bike,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: (Text("Fix Record Data")),
            backgroundColor: Colors.grey[700],
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        _admin_name(),
                        _customer_data(),
                        _price_fix(),
                        _notes()
                      ],
                    ))),
          ),
        ));
  }
}
