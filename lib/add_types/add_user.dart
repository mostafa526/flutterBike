//import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/pages/add.dart';
import 'package:shiref_bike/widgets/shared.dart';

import '../main.dart';

class add_user extends StatefulWidget {
  @override
  _add_userState createState() => _add_userState();
}

class _add_userState extends State<add_user> {
  final _formkey = GlobalKey<FormState>();
  String _userid, _rentcost, _qr, _name, _passw;
  DateTime _date;
  TimeOfDay _time;
  String _phonenum;
  var Cami = Colors.grey;
  var Camu = Colors.grey;

  bool _t = false,
      _d = false,
      _q = false,
      f = false,
      flag1 = false,
      flag2 = false;
  Widget _textT() {
    return Text(
      ' Only loyal Customers should be added',
      style: TextStyle(
          color: Colors.grey[600], fontSize: 18, fontWeight: FontWeight.bold),
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
          validator: (val) =>
              val.length != 14 ? 'Enter correct ID number' : null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'UserId',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'national id required ',
            icon: Icon(
              Icons.face,
              color: Colors.grey[500],
            ),
          ),
        ));
  }

  final productholder = TextEditingController();

  Widget _username() {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextFormField(
          controller: productholder,
          onSaved: (val) => _name = val,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'User Name',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'fmaily name included',
            icon: Icon(
              Icons.perm_identity,
              color: Colors.grey[500],
            ),
          ),
        ));
  }

  final noteholder = TextEditingController();
  final phoneholder = TextEditingController();

  File _image;
  File _userImage;

  Widget _ucamera() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.camera_enhance,
            size: 40,
            color: Colors.black,
          ),
          color: Camu,
          onPressed: () async {
            try {
              await ugetImage();
            } catch (e) {
              setState(() {
                this.Camu = Colors.red;
              });
            }
          },
          tooltip: 'shoot picture',
        )
      ],
    );
  }

  Future ugetImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      try {
        this._userImage = File(image.path);
        this.Camu = Colors.green;

        this.flag1 = true;
      } catch (e) {
        this.Camu = Colors.red;
      }
    });
  }
  // String _name_product, _descripto, _product_cost,_rent_cost;

  Widget _camera() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(
            Icons.camera_enhance,
            size: 40,
            color: Colors.black,
          ),
          color: Cami,
          onPressed: () async {
            try {
              await getImage();
            } catch (e) {
              setState(() {
                this.Cami = Colors.red;
              });
            }
          },
          tooltip: 'shoot picture',
        )
      ],
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
              "Add",
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
    holder.clear();
    noteholder.clear();
    phoneholder.clear();
  }

  void _submit() {
    if (flag1 == true && flag2 == true) {
      if (_formkey.currentState.validate()) {
        _formkey.currentState.save();
        clearTextInput();
        try {
          _upload(_image, _userImage);
        } catch (e) {
          print("connection error");
        }

        print(
            'id:$_userid , price :$_rentcost ,return Date: $_date ,return time: $_time ,CODE: $_qr ');
        setState(() {
          Cami = Colors.grey;
          Camu = Colors.grey;
          flag1 = false;
          flag2 = false;
        });
      } else {
        print('not !');
      }
    } else {
      fail();
    }
  }

  final holder = TextEditingController();

  Widget _pass() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: true,
        controller: holder,
        onSaved: (val) => _passw = val,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Password',
            icon: Icon(Icons.lock, color: Colors.grey[500])),
      ),
    );
  }

  Widget _phone() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: true,
        controller: phoneholder,
        onSaved: (val) => _phonenum = val,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.black),
            hintText: 'Password',
            icon: Icon(Icons.phone, color: Colors.grey[500])),
      ),
    );
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      try {
        this._image = File(image.path);
        this.flag2 = true;
        this.Cami = Colors.green;
      } catch (e) {
        this.Cami = Colors.red;
      }
    });
  }
  // String _name_product, _descripto, _product_cost,_rent_cost;

  void _upload(File file, File ufile) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    String fileName;
    fileName = file.path.split('/').last;
    String ufileName = ufile.path.split('/').last;

    FormData data = FormData.fromMap({
      "idImage": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      "userimage": await MultipartFile.fromFile(
        ufile.path,
        filename: ufileName,
      ),
      "name": _name,
      "userid": _userid,
      "password": _passw,
      "phone": _phonenum,
      "adress": "nulllll on id !",
    });

    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";

    dio
        .post("http://nabilmokhtar.pythonanywhere.com/User/User/", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Widget fail() {
    setState(() {
      this.Cami = Colors.red;
      this.Camu = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            "Add Customer",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[800],
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.lightGreen[500],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        _textT(),
                        _idInput(),
                        _username(),
                        _pass(),
                        _phone(),
                        Row(
                          children: <Widget>[
                            Text("id image"),
                            _camera(),
                            Text("user image"),
                            _ucamera(),
                          ],
                        ),
                        Divider(
                          color: Colors.transparent,
                          thickness: 10,
                        ),
                        _submitbtn(),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
