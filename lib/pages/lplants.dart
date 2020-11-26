import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndexPlants extends StatefulWidget {
  @override
  _IndexPlants createState() => _IndexPlants();
}

class _IndexPlants extends State<IndexPlants> {
  String url = 'https://api.sheety.co/9077bd5ab636fbf2c6077649c27fb909/bdCaribeSmartsPlants/plantas';
  List data;

  // ignore: missing_return
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["plantas"];
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //appBar: new AppBar(
         // title: new Text('Lista de Plantas'),
        //),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              return new ListTile(
                title: new Text(data[i]["ncomun"]),
                subtitle: new Text(data[i]["ncientifico"]),
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(data[i]["image"]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new SecondPage(data[i])));
                },
              );
            }));
  }
}
class SecondPage extends StatelessWidget{
  SecondPage (this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(data["ncomun"]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200.0,
            ),
            //width: 100.0, height: 100.0,
            decoration: new BoxDecoration(
              color: const Color(0xffc94b6),
              image: new DecorationImage(
                image: new NetworkImage(data["imagemax"]),
                //centerSlice: new Rect.fromLTWH(50.0, 50.0, 320.0, 90.0),
                fit: BoxFit.cover,
              ),
              //borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
              border: new Border.all(
                color: Colors.red,
                width: 4.0,
            ),
          ),
          ),
          new Container(
              color: Colors.white,
              child: new Container(
                    child: new Column(
                        children : [
                          new Padding(padding: EdgeInsets.only(top: 10.0)),
                          //new Text(data["ncientifico"], style: TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0)),
                          new Text(data["ncientifico"],  style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.green[700],
                          ),),
                          new Padding(padding: EdgeInsets.only(top: 10.0)),
                          new Text(data["descripcion"],       style: TextStyle(fontSize: 12), textAlign: TextAlign.justify),
                          new Padding(padding: EdgeInsets.only(top: 10.0)),
                          Text("Familia: "+data["familia"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),textAlign: TextAlign.center),
                          Text("Género: "+data["genero"],   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
                          //new Text("Género => "+data["genero"],     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.justify)
                        ]
                    )
                ),
              )
      ]
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}