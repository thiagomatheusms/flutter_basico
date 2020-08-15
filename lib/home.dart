import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/detail.dart';

class Contact<T> {
  var name;
  var telephone;
  Contact(this.name, this.telephone);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Contact<String>> list;

  void initState() {
    super.initState();
    populateData();
  }

  void populateData() {
    list = [];
    for (int i = 0; i < 10; i++)
      list.add(Contact<String>("Thiago ${i}", "87 1111-111${i}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: _ItemList,
          )),
    );
  }

  Widget _ItemList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => Detail(list[index])));
      },
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(radius: 40, backgroundColor: Colors.white),
                CircleAvatar(
                  radius: 29.5,
                  backgroundColor: Colors.orangeAccent,
                ),
                Text('TM',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20))
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${list[index].name}", style: TextStyle(fontSize: 20)),
                Text("${list[index].telephone}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            )
          ],
        ),
      )),
    );
  }
}
