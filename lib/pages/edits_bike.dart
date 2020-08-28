import 'package:flutter/material.dart';

import 'package:shiref_bike/lists/main_list_for_rent.dart';

class edit_bike extends StatelessWidget {
  main_bike k;
  edit_bike(main_bike k) {
    this.k = k;
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController b1, b2, b3, b4, b5, b6;
  String _name_product,
      _descripto,
      _product_cost,
      _rent_costday,
      _rent_costweek,
      _rent_costmonth;
  put() {
    TextEditingController e1 = TextEditingController(text: k.get_description());
    TextEditingController e2 = TextEditingController(text: k.get_model());
    TextEditingController e3 =
        TextEditingController(text: k.get_sell_price().toString());
    TextEditingController e4 =
        TextEditingController(text: k.get_per_day().toString());
    TextEditingController e5 =
        TextEditingController(text: k.get_per_week().toString());
    TextEditingController e6 =
        TextEditingController(text: k.get_per_month().toString());
    b1 = e1;
    b2 = e2;
    b3 = e3;
    b4 = e4;
    b5 = e5;
    b6 = e6;
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b1,
        onSaved: (newValue) => _descripto = newValue.toString(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'description',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'description',
        ),
        maxLines: 2,
      ),
    );
  }

  clearTextInput() {
    b1.clear();
    b2.clear();
    b3.clear();
    b4.clear();
    b5.clear();
    b6.clear();
  }

  Widget _productname() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b2,
        onSaved: (val) => _name_product = val.toString(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Bike Model',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Ex: cycle pro , trinx ',
          icon: Icon(
            Icons.directions_bike,
            color: Colors.lightGreen[500],
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b3,
        onSaved: (val) => _product_cost = val.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: 'EGP',
          suffixStyle: TextStyle(color: Colors.green),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Product Price',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Price will be displayed in site',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _rentpriceday() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b4,
        onSaved: (val) => _rent_costday = val.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: 'EGP',
          suffixStyle: TextStyle(color: Colors.green),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Rent per day Cost',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Rent per day Cost',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _rentpriceweek() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b5,
        onSaved: (val) => _rent_costweek = val.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: 'EGP',
          suffixStyle: TextStyle(color: Colors.green),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Rent per week Cost',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Rent per week Cost',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _rentpricemonth() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: b6,
        onSaved: (val) => _rent_costmonth = val.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: 'EGP',
          suffixStyle: TextStyle(color: Colors.green),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Rent per month Cost',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Rent per month Cost',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _submitbtn() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          clearTextInput();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightGreen[300], Colors.lightGreen[500]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 150.0, minHeight: 80.0),
            alignment: Alignment.center,
            child: Text(
              "Submit",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

  bool _switchVal = false;
  bool _isEnabled = false;

  Widget _switch() {
    return Row(
      children: [
        Text(
          'Rentable',
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold),
        ),
        Center(
          child: Switch(
              inactiveTrackColor: Colors.grey[300],
              inactiveThumbColor: Colors.grey[600],
              activeTrackColor: Colors.lightGreen[100],
              activeColor: Colors.lightGreen[300],
              value: this._switchVal,
              onChanged: (bool value) {
                this._switchVal = value;
                this._isEnabled = !this._isEnabled;
              }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    put();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Edit Bike",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[800],
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.lightGreen[500],
          ),
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
                    _productname(),
                    _description(),
                    _switch(),
                    _priceinput(),
                    _rentpriceday(),
                    _rentpriceweek(),
                    _rentpricemonth(),
                    Divider(
                      color: Colors.transparent,
                      thickness: 10,
                    ),
                    _submitbtn(),
                  ],
                ))),
      ),
    );
  }
}
