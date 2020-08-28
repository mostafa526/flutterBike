import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';

class rent_action extends StatefulWidget {
  @override
  _rent_actionState createState() => _rent_actionState();
}

class _rent_actionState extends State<rent_action> {
  final _formkey = GlobalKey<FormState>();
  String _userid, _rentcost, _qr, _note;
  DateTime _date;
  TimeOfDay _time;
  bool _switchVal = false;
  bool isEnabled = true;

  bool _t = false, _d = false, _q = false;
  Widget _textT() {
    return Text(
      'Rent',
      style: TextStyle(
          color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();

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

  Widget _dataTime() {
    //clock
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(30),
          child: Center(
              child: IconButton(
            icon: Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            onPressed: isEnabled
                ? () {
                    DateTime now = DateTime.now();

                    showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay(hour: now.hour, minute: now.minute),
                    ).then((TimeOfDay value) {
                      if (value != null) {
                        _time = value;
                        _t = true;
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('${value.format(context)}'),
                          action: SnackBarAction(label: 'Ok', onPressed: () {}),
                        ));
                      }
                    });
                  }
                : null,
          )),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Center(
              child: IconButton(
            // color: Colors.blue,
            icon: Icon(Icons.calendar_today),
            onPressed: isEnabled
                ? () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2025))
                        .then((DateTime value) {
                      if (value != null) {
                        _date = value;
                        _d = true;
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Selected datetime :$value'),
                        ));
                      }
                    });
                  }
                : null,
          )),
        ),
      ],
    );
  }

  clearTextInput() {
    holder.clear();
    idholder.clear();
  }

  void _qrscanner() async {
    _qr = await scanner.scan();
    _submit();
  }

  Widget _switch() {
    return Row(
      children: [
        Text('Open'),
        Center(
          child: Switch(
              value: this._switchVal,
              onChanged: (bool value) {
                setState(() {
                  this._switchVal = value;
                  this.isEnabled = !this.isEnabled;
                });
              }),
        )
      ],
    );
  }

  Widget _submitbtn() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          _qrscanner();
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
              "Rent Bike",
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

  void _submit() async {
    if (_formkey.currentState.validate()) {
      // Future<String> x = _qrscanner();

      if (_switchVal == true) {
        _t = true;
        _d = true;
      }

      if (_t == true && _d == true && _qr != null) {
        _formkey.currentState.save();
        print(
            'id:$_userid , price :$_rentcost ,return Date: $_date ,return time: $_time ,CODE: $_qr ');
        _upload();
        clearTextInput();
      } else {
        print('bike,date and time must be selected !');
      }
    } else {
      print('not !');
    }
  }

  void _upload() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;
    final admin = prefs.getString('name') ?? 0;

    Dio dio = new Dio();

    dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";
    dio
        .post("http://nabilmokhtar.pythonanywhere.com/Records/RentRecords/",
            data: {
              "customer": _userid,
              "bike": _qr,
              "status": false,
              "ends": "agdgy",
              "note": _note,
              "price": _rentcost,
              "adminName": admin
            })
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: holder,
        onSaved: (val) => _rentcost = val,
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
            labelText: 'Rent Cost',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Price will be assigned to your Id ',
            icon: Icon(
              Icons.attach_money,
              size: 30,
              color: Colors.grey[500],
            )),
      ),
    );
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
                    _notes(),
                    _switch(),
                    _dataTime(),
                    _submitbtn(),
                  ],
                ))),
      ),
    );
  }
}
