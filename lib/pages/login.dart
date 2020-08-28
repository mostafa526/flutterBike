import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/main.dart';
import 'package:shiref_bike/pages/actions.dart';
import 'package:shiref_bike/services/api_service.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  String _userid, _passw;
  bool _f = false;

  Widget _textT() {
    return Text(
      'Login ',
      style: TextStyle(
          color: Colors.grey[800],
          fontSize: 42,
          fontWeight: FontWeight.bold,
          // shadows: [
          //   Shadow(
          //     blurRadius: 20,
          //     color: Colors.lightGreen[500],
          //     offset: Offset(5.0, 5.0),
          //   ),
          // ],
          fontFamily: "Bernard MT Condensed"),
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
        // keyboardType: TextInputType.number,
        // validator: (val) => val.length != 14 ? 'Enter correct ID number' : null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen[500]),
          ),
          labelText: 'UserId',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'requried',
          icon: Icon(
            Icons.person,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  clearTextInput() {
    holder.clear();
    idholder.clear();
  }

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
          hintText: 'requried',
          icon: Icon(
            Icons.lock,
            color: Colors.grey[500],
            size: 40,
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      final apiSer = apiService(_userid, _passw);
      final accesstoken = await apiSer.getAccesToken();

      print('id:$_userid CODE:$_passw token :$accesstoken');

      // if (accesstoken != null) {
      clearTextInput();
      if (accesstoken != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', accesstoken);
        prefs.setString('name', _userid);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return MyApp();
        }));
      } else {
        setState(() {
          this._f = true;
        });
      }

      // }
      // login = true;
    } else {
      print('not !');
    }
  }

  Widget _sbtn() {
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
            constraints: BoxConstraints(maxWidth: 250.0, minHeight: 80.0),
            alignment: Alignment.center,
            child: Text(
              "Login",
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

  Widget fail(bool f) {
    if (f == true) {
      return Text(
        'Login failed',
        style: TextStyle(
            color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        '',
        style: TextStyle(
            color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        _textT(),
                        _idInput(),
                        _pass(),
                        Divider(
                          color: Colors.transparent,
                          thickness: 10,
                        ),
                        _sbtn(),
                        fail(_f)
                        // submitbtn(_formkey, holder, idholder),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
