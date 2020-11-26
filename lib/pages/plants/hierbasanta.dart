import 'package:flutter/material.dart';

class HierbaSanta extends StatefulWidget {
  @override
  _HierbaSanta createState() => _HierbaSanta();
}

class _HierbaSanta extends State<HierbaSanta> {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child :Text('Es una planta sub-arbustiva que cuenta con muchas ramificaciones y con el tiempo su'
                        'base es semi- leñosa a leñosa, es aromática y perenne, es decir, que perdura con el tiempo. Su altura'
                        'varía entre los 40 a 100 cm; Sus hojas, algo carnosas y de color verde glauco, o verde azuladas, son'
                        'alternas, bi-o tripinnadas, esto se refiere a que cada foliolo (hoja) se articulan en un tallo central'
                        'formando ángulo recto y en numerosas ramificaciones; con folios (hojas) oblongos (más largas que'
                        'anchas) o espatulados. Su flor es un corimbo, con pequeñas flores de cuatro o cinco pétalos'
                        'amarillos y sus frutos son capsulas redondas, su sabor es un poco amargo. (Glority Software Limited,'
                        'Liuhe Road Binjiang District, Hangzhou, ZHEJIANG, 2020)',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify)
                ),
                //Need to add space below this Text ?
                new Text("Género: piper-pimientas",
                  style: new TextStyle(
                      color: Colors.grey[850],
                      fontSize: 16.0
                  ),
                ),
                new Text("Familia: piperaceae-pimientas",
                  style: new TextStyle(
                      color: Colors.grey[850],
                      fontSize: 16.0
                  ),
                ),
              ],
            ),
          ),
          //new Icon(Icons.favorite, color: Colors.red),
          //new Text(" 100", style: new TextStyle(fontSize: 16.0),),
        ],
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Hierba Santa (Piper auritum)'),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.asset(
                    'assets/big/mhierba_santa.jpg',
                    fit: BoxFit.cover
                ),
                //You can add more widget bellow
                titleSection
              ],
            )
        )
    );//Widget with "Material design"
  }
}