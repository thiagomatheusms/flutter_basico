import 'package:flutter/material.dart';
import 'package:projeto_flutter/home.dart';

class Detail extends StatelessWidget {
  final Contact contact;

  Detail(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Text("${contact.name}"),
    );
  }
}
