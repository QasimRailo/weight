import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int radiovalue = 0;
  double _finalresult = 0.0;
  String formattedText = "";
  final TextEditingController _c = new TextEditingController();

  void onradiovaluechanged(int value) {
    setState(() {
      radiovalue = value;
      switch (radiovalue) {
        case 0:
          _finalresult = claculate(_c.text, 0.06);
          formattedText =
              "Your Weight on Pluto is:${_finalresult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalresult = claculate(_c.text, 0.38);
          formattedText =
              "Your Weight on Mars is:${_finalresult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalresult = claculate(_c.text, 0.91);
          formattedText =
              "Your Weight on Venus is:${_finalresult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2),
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              height: 200,
              width: 200,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _c,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your Weight On Earth",
                        hintText: "In POUNDS",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.5)),

                  ///Adding Three Radio Buttons
                  ///
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radiovalue,
                          onChanged: onradiovaluechanged),
                      new Text("Pluto",
                          style: new TextStyle(
                            color: Colors.white54,
                          )),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radiovalue,
                          onChanged: onradiovaluechanged),
                      new Text("Mars",
                          style: new TextStyle(
                            color: Colors.white54,
                          )),
                      new Radio<int>(
                          activeColor: Colors.deepOrangeAccent,
                          value: 2,
                          groupValue: radiovalue,
                          onChanged: onradiovaluechanged),
                      new Text("Venus",
                          style: new TextStyle(
                            color: Colors.white54,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      _c.text.isEmpty
                          ? "Please Enter Weight in POUNDS"
                          : formattedText + "lbs",
                      // "$formattedText lbs",
                      style: new TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double claculate(String t, double d) {
    if (t.isNotEmpty && int.parse(t) > 0) {
      return int.parse(t) * d;
    }
  }
}
