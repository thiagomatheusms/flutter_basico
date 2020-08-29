import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/detail.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Contact<T> {
  var index;
  var name;
  var telephone;
  var photo;
  Contact(this.index, this.name, this.telephone, this.photo);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Contact<String>> list;

  Future<List<Contact>> _getContacts() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/cfOSsaBeaa?indent=2");

    var jsonData = json.decode(data.body);

    List<Contact> contacts = [];

    for (var cont in jsonData) {
      Contact contact =
          Contact(cont["index"], cont["name"], cont["phone"], cont["photo"]);

      contacts.add(contact);
    }

    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Container(
        padding: EdgeInsets.only(top: 16),
        child: FutureBuilder(
          future: _getContacts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  Detail(snapshot.data[index])));
                    },
                    child: Card(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                  radius: 48,
                                  backgroundImage:
                                      NetworkImage(snapshot.data[index].photo)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(snapshot.data[index].name,
                                  style: TextStyle(fontSize: 26)),
                              Text(snapshot.data[index].telephone,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                    )),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
