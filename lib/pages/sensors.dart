import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String c = '';
String f = '';
String h = '';
String l = '';

BuildContext scaffoldContext;

displaySnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {},
    ),
  );
  //Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Sensors extends StatefulWidget {
  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensors> {
  @override
  void initState() {
    super.initState();
    getSensorData(); // Getting initial state of LED, which is by default on
  }

  String _status = '';
  String url =
      'http://192.168.1.200:80/'; //IP Address which is configured in NodeMCU Sketch
  var response;
  bool progressIndicator = true;

  getSensorData() async {
    try {
      response = await http.get(url + 'dht', headers: {"Accept": "plain/text"});
      if (response.body == 'sensorError') {
        setState(() {
          _status = 'Dispositivo No Conectado';
          c = '';
          f = '';
          h = '';
          l = '';
          progressIndicator = false;
          displaySnackBar(context, 'Verifique la conexión del dispositivo');
        });
      } else {
        setState(() {
          _status = 'Dispositivo Conectado';
          progressIndicator = false;
        });
        c = response.body.substring(0, 4) + '°C';
        print('Temperatura: ' + c);
        //f = '1500' + 'µS/cm';
        f = response.body.substring(6, 10) + 'µS/cm';
        //print('Fertilidad: ' + f);
        h = response.body.substring(12, 16) + '%';
        //print('Humedad: ' + h);
        //l = '4500' + 'lux';
        l = response.body.substring(6, 10) + 'lux';
        //print('Luminosidad: ' + l);
      }
    } catch (e) {
      // If NodeMCU is not connected, it will throw error
      print(e);
      if (this.mounted) {
        setState(() {
          _status = 'Dispositivo no conectado';
          c = '';
          f = '';
          h = '';
          l = '';
          progressIndicator = false;
          displaySnackBar(context, 'Problema en la conexión WiFi');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:
      //AppBar(title: Text("Lectura de Sensores"), centerTitle: false),
      body: Builder(builder: (BuildContext context) {
        scaffoldContext = context;
        return Center(
          child: ListView(
            //scrollDirection: Axis.horizontal,
            //padding: const EdgeInsets.only(top: 10.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('Temperatura'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('5.0 - 35.0(°C)'),
                        ),
                        Image(
                          image: AssetImage('assets/temperature.png'),
                          width: 70.0,
                          height: 70.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(c)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('Fertilidad'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('350 - 2000(μS/cm)'),
                        ),
                        Image(
                          image: AssetImage('assets/soil.png'),
                          width: 70.0,
                          height: 70.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(f)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('Humedad'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('15 - 60(%)'),
                        ),
                        Image(
                          image: AssetImage('assets/hum.png'),
                          width: 70.0,
                          height: 70.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(h)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('Luminosidad'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text('2500 - 55000(lux)'),
                        ),
                        Image(
                          image: AssetImage('assets/sun.png'),
                          width: 70.0,
                          height: 70.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(l))
                      ],
                    ),
                  ),
                ],
              ),
              progressIndicator
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Container(),
              Container(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressIndicator = true;
                        });
                        getSensorData();
                      },
                      child: Text('Actualizar'),
                    ),
                  ],
                ),
              ),
              Text(
                _status,
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      }),
    );
  }
}
