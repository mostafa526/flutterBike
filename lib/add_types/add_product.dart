import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shiref_bike/pages/add.dart';

import '../main.dart';

class add_product extends StatefulWidget {
  @override
  _add_productState createState() => _add_productState();
}

class _add_productState extends State<add_product> {
  final _formkey = GlobalKey<FormState>();
  String _name_product, _descripto, _product_cost;
  File _image;
  bool _photo = false;
  bool uploaded = true;

  Widget _textT() {
    return Text(
      'Add Product',
      style: TextStyle(
          color: Colors.grey[600], fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        onSaved: (newValue) => _descripto = newValue,
        validator: (value) => value.length > 0 ? null : 'Enter description ',
        controller: holder,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Description',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Description',
        ),
        maxLines: 2,
      ),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();

  clearTextInput() {
    idholder.clear();
    holder.clear();
    priceholder.clear();
  }

  Widget _productname() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: idholder,
        onSaved: (val) => _name_product = val,
        // keyboardType: TextInputType.number,
        validator: (val) => val.length > 3 ? null : 'Enter correct name ',
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'Product Name',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'Product Name',
          icon: Icon(
            Icons.receipt,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  final priceholder = TextEditingController();

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: priceholder,
        onSaved: (val) => _product_cost = val,
        keyboardType: TextInputType.number,
        validator: (value) => value.length > 0 ? null : 'Enter correct price',
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
          hintText: 'Product Price',
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
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formkey.currentState.validate() && _photo == true) {
      _formkey.currentState.save();
      clearTextInput();
      _upload(_image);
    } else {
      print('error in validation');
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
          iconSize: 40,
          onPressed: () async => getImage(),
          tooltip: 'shoot picture',
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
      this._photo = true;
      this._image = File(image.path);
    });
  }
  // String _name_product, _descripto, _product_cost,_rent_cost;

  void _upload(File file) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;

    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      "name": _name_product,
      "description": _descripto,
      "sellPrice": _product_cost,
      "availability": true,
      "branche": 1,
    });
    Dio dio = new Dio();

    dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";

    dio
        .post("http://nabilmokhtar.pythonanywhere.com/Products/Accessories/",
            data: data)
        .catchError((error) {
      setState(() {
        this.uploaded = false;
        print(uploaded);
        print(
            'sxytdtudfyulflyifufulfuydfuydfuydyfyfukfuf////////////////////////');
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Failed to add Product!"),
                content: Text(
                    "Please enter a valid data or check your Internet Connection"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.green[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              );
            });
      });
    });
    if (uploaded) {
      setState(() {
        return AlertDialog(
          title: Text("Successfully added"),
          content: Text("this product has been added Successfuly"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.green[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
          ],
        );
      });
    } //if uploaded

    //  .then((response) => print(response));
    //   .catchError((error) => print(error));
    // } on DioError catch (e) {
    //   print(
    //       "exception*****************************************************************************");
    //   if (e.response != null) {
    //     print(e.response.data);
    //     print(e.response.headers);
    //     print(e.response.request);
    //   } else {
    //     // Something happened in setting up or sending the request that triggered an Error
    //     print(e.request);
    //     print(e.message);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Add product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Colors.grey[800],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
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
                    _camera(),
                    _priceinput(),
                    _description(),
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
