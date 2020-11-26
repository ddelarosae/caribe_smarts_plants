import 'package:flutter/material.dart';
import 'package:flutter_app_listviewer/themes/constant.dart';
import 'package:flutter_app_listviewer/widgets/dog_card.dart';
import 'package:flutter_app_listviewer/widgets/walk_card_dog.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,  children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Desarrollado por:",
                    style: appTitle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: size.width * 0.7,
                      child: Text("Dairo Andres Meriño Jaimes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                  SizedBox(
                      width: size.width * 0.7,
                      child: Text(
                        "Daniel Andres Díaz Daza", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  DogCard(),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Colaboradores".toUpperCase(),style: TextStyle(fontSize: 17,),)
                    ],
                  ),
                  SizedBox(height: 20,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        WalkGroupCard(imgScr: "assets/parque.png",title: "Parque Biotemático Megua",members: "20 miembros",location: "Galapa, Atlántico",orgBy: "Iader Lamilla",),
                        WalkGroupCard(imgScr: "assets/emerge.png",title: "Emerge Tecnologías S.A.S",members: "3 miembros",location: "Yopal, Casanare",orgBy: "Daniel De la rosa",),
                        WalkGroupCard(imgScr: "assets/autonoma.png",title: "UniAutónoma del Caribe",members: "2 asesores",location: "Barranquilla, Atlántico",orgBy: "José Escorcia & Meglys Pérez"),
                        // WalkGroupCard()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}