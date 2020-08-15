import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/home.dart';

void main() => runApp(new MaterialApp(home: HomeLogin()));

class HomeLogin extends StatefulWidget {
  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: size.height,
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("img/sophia.png", width: size.width / 50 * 30),
              SizedBox(height: 30),
              Platform.isAndroid
                  ? SizedBox(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: "e-mail"),
                          ),
                          TextField(
                              decoration: InputDecoration(labelText: "senha")),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Lembrar de mim"),
                                  Checkbox(
                                      value: remember,
                                      activeColor: Colors.orangeAccent,
                                      onChanged: (bool isRemember) {
                                        setState(() {
                                          remember = isRemember;
                                        });
                                      }),
                                ],
                              ),
                              SizedBox(
                                  width: size.width / 2,
                                  child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home()));
                                      },
                                      child: Text("Entrar",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Colors.orangeAccent))
                            ],
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      child: Column(
                        children: <Widget>[
                          CupertinoTextField(
                            placeholder: "e-mail",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CupertinoTextField(
                            placeholder: "senha",
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Lembrar de mim"),
                                  Checkbox(
                                      value: remember,
                                      activeColor: Colors.orangeAccent,
                                      onChanged: (bool isRemember) {
                                        setState(() {
                                          remember = isRemember;
                                        });
                                      }),
                                ],
                              ),
                              CupertinoButton(
                                  child: Text(
                                    "Entrar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.orangeAccent,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  })
                            ],
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
