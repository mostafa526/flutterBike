import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';

class sell_action extends StatefulWidget {
  @override
  _sell_actionState createState() => _sell_actionState();
}

class _sell_actionState extends State<sell_action> {
  final _formkey = GlobalKey<FormState>();
  String _userid, _sellcost, _note, _productName;

  Widget _textT() {
    return Text(
      'Sell',
      style: TextStyle(
          color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  final idholder = TextEditingController();

  Widget _idInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: idholder,
        onSaved: (val) => _userid = val,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'User Id',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'National Id required',
            icon: Icon(
              Icons.face,
              size: 30,
              color: Colors.grey[500],
            )),
      ),
    );
  }

  final productholder = TextEditingController();

  Widget _productId() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: productholder,
        onSaved: (val) => _productName = val,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Bike Id',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Price will be assigned to your Id',
            icon: Icon(
              Icons.directions_bike,
              size: 30,
              color: Colors.grey[500],
            )),
      ),
    );
  }

  final noteholder = TextEditingController();

  Widget _notes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        onSaved: (newValue) => _note = newValue,
        controller: noteholder,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Notes',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Describe an Issue or Apply Discount ',
            icon: Icon(
              Icons.note_add,
              size: 30,
              color: Colors.grey[500],
            )),
        maxLines: 2,
      ),
    );
  }

  Widget _submitbtn() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          _submit();
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
              "Sell Bike",
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

  clearTextInput() {
    idholder.clear();
    productholder.clear();
    priceholder.clear();
    noteholder.clear();
  }

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      clearTextInput();
      _upload();
    } else {
      print('no !');
    }
  }

  final priceholder = TextEditingController();

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: priceholder,
        onSaved: (val) => _sellcost = val,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Rent Cost',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Price will be assigned to your Id ',
            icon: Icon(
              Icons.note_add,
              size: 30,
              color: Colors.grey[500],
            )),
      ),
    );
  }

  void _upload() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;
    final admin = prefs.getString('name') ?? 0;

    Dio dio = new Dio();
    // dio.options.headers["Authorization"] = "token $token";

    dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";
//('id', 'notes', 'url')
    dio
        .post("http://nabilmokhtar.pythonanywhere.com/Records/SellRecord/",
            data: {
              "customer": _userid,
              "price": _sellcost,
              "notes": _note,
              "product": _productName,
              "dateTime": "null",
              "adminName": admin
            })
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    _textT(),
                    _idInput(),
                    _priceinput(),
                    _productId(),
                    _notes(),
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
