import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/pages/add.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class add_bike extends StatefulWidget {
  @override
  _add_bikeState createState() => _add_bikeState();
}

class _add_bikeState extends State<add_bike> {
  final _formkey = GlobalKey<FormState>();
  String _name_product,
      _descripto,
      _product_cost,
      _rent_cost,
      _rentperday,
      _rentperweek,
      _branch;
  File _image;
  List<Asset> _images = List<Asset>();

  bool photo_exist = false;

  Widget _textT() {
    return Text(
      'Add Bike',
      style: TextStyle(
          color: Colors.grey[600], fontSize: 18, fontWeight: FontWeight.bold),
    );
  } //text

  Widget _description() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        onSaved: (newValue) => _descripto = newValue,
        controller: holder,
        validator: (value) => value.length > 0 ? null : "enter description",
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

  final idholder = TextEditingController();
  final holder = TextEditingController();
  final rentholder = TextEditingController();
  final rentholderd = TextEditingController();
  final rentholderw = TextEditingController();
  final bholder = TextEditingController();

  final priceholder = TextEditingController();

  clearTextInput() {
    idholder.clear();
    holder.clear();
    rentholder.clear();
    rentholderd.clear();
    rentholderw.clear();
    priceholder.clear();
    bholder.clear();
  }

  Widget _productname() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: idholder,
        onSaved: (val) => _name_product = val,
        // keyboardType: TextInputType.number,
        validator: (val) => val.length > 0 ? null : 'Enter correct name',
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

  Widget _branchname() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: bholder,
        onSaved: (val) => _branch = val,
        // keyboardType: TextInputType.number,
        validator: (val) => val.length > 0 ? null : 'Enter correct name',
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Branch',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Branch',
        ),
      ),
    );
  }

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: priceholder,
        onSaved: (val) => _product_cost = val,
        keyboardType: TextInputType.number,
        validator: (val) => val.length > 0 ? null : 'Enter correct price',
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
          hintText: 'Price will be displayed in the site',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _rentprice() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: rentholder,
        onSaved: (val) => _rent_cost = val,
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
          labelText: 'Rent per Month Cost',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Rent per Month Cost',
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _rentperdayprice() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: rentholderd,
        onSaved: (val) => _rentperday = val,
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

  Widget _rentperweekprice() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: rentholderw,
        onSaved: (val) => _rentperweek = val,
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

  void _submit() {
    if (_formkey.currentState.validate() && photo_exist == true) {
      _formkey.currentState.save();
      clearTextInput();
      _upload(_image);
    } else {
      print('not !');
    }
  }

  Widget _camera() {
    return ButtonBar(
      children: [
        Text(
          "Add Product photo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.camera_enhance),
          color: Colors.black,
          iconSize: 40,
          onPressed: () async => await getImage(),
          tooltip: 'shoot picture',
        )
      ],
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
              //inactive mode
              inactiveTrackColor: Colors.grey[300],
              inactiveThumbColor: Colors.grey[600],
              activeTrackColor: Colors.lightGreen[100],
              activeColor: Colors.lightGreen[300],
              value: this._switchVal,
              onChanged: (bool value) {
                setState(() {
                  this._switchVal = value;
                  this._isEnabled = !this._isEnabled;
                });
              }),
        )
      ],
    );
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      this._image = File(image.path);
      this.photo_exist = true;
    });
  }
  // String _name_product, _descripto, _product_cost,_rent_cost;

  void _upload(File file) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    final admin = prefs.getString('admin') ?? 0;
    print(admin);
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      "model": _name_product,
      "serial": "000",
      "availability": true,
      "rentability": _isEnabled,
      "availabilityDuration": " avilable",
      "description": _descripto,
      "sellPrice": _product_cost,
      "rentPerDay": _rentperday,
      "rentPerWeek": _rentperweek,
      "rentPerMonth": _rent_cost,
      "branche": _branch,
      "images": _images,
    });

    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";

    dio
        .post("http://nabilmokhtar.pythonanywhere.com/apiBike/", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }
/* 
  uploadFile() async {
    var postUri =
        Uri.parse("http://hassanharby2000.pythonanywhere.com/Products/Bike/");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    request.files.add(new http.MultipartFile.fromBytes(
        'file', await File.fromUri(_image.path).readAsBytes(),
        contentType: new MediaType('image', 'jpeg')));

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Add Bike",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[800],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.lightGreen[500],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
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
                    _textT(),
                    _productname(),
                    _switch(),
                    _camera(),
                    _priceinput(),
                    _rentprice(),
                    _rentperweekprice(),
                    _rentperdayprice(),
                    _description(),
                    _branchname(),
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
