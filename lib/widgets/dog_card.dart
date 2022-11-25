import 'package:flutter/material.dart';
import 'package:flutter_app_listviewer/themes/constant.dart';

class DogCard extends StatelessWidget {
  const DogCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: primary, blurRadius: 0.5)
                  ]),
              child: Align(
                alignment: Alignment.centerRight,
                child:  Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: //Text("Estudiantes Ingeniería ElectrónicaUniversidad Autónoma Del Caribe",style:contentWhite, )
                  Text("Estudiantes Ingeniería ElectrónicaUniversidad Autónoma Del Caribe",style: TextStyle(color: Colors.white, fontSize: 12.0))
                ),
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.only(left: 10),
            child: Image.asset("assets/pair_programming.png"),
          )
        ],
      ),
    );
  }
}