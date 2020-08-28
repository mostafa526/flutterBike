import 'package:flutter/material.dart';
import 'package:shiref_bike/record/sellrecord.dart';
import 'package:shiref_bike/user/user_data.dart';

class selled_record extends StatelessWidget {
  final sell_recordd k;
  final user u;
  selled_record(this.k, this.u);

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

  Widget _price() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_price().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'price',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _product() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_product()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'product',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _time() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_datatime()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'datetime',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _customer_data_user_idimage() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GridTile(
          child: Image.network(
        u.get_id_image(),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget _customer_data_user_image() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GridTile(
          child: Image.network(
        u.get_user_image(),
        fit: BoxFit.fill,
      )),
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
            title: (Text("Sell Record Data")),
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
                        _customer_data_user_idimage(),
                        //Spacer(),
                        _customer_data_user_image(),
                        //Spacer(),
                        _admin_name(),
                        _price(),
                        _notes(),
                      ],
                    ))),
          ),
        ));
  }
}
