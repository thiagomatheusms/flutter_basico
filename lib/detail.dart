import 'package:flutter/material.dart';
import 'package:projeto_flutter/home.dart';

class Detail extends StatelessWidget {
  final Contact contact;

  Detail(this.contact);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            width: size.width,
            child: Card(
              child: Container(
                height: 250,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: size.width,
                        color: Colors.orangeAccent,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                  radius: 48,
                                  backgroundImage: NetworkImage(contact.photo)),
                              SizedBox(
                                height: 20,
                              ),
                              Text("${contact.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text("${contact.telephone}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
