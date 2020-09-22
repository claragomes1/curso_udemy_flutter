import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController topLeftController = TextEditingController();
  TextEditingController bottomLeftController = TextEditingController();
  TextEditingController topRightController = TextEditingController();
  TextEditingController bottomRightController = TextEditingController();

  String teste1 = '10.0';
  double testeFunction(String teste1) {
    double teste = double.parse(teste1);
    return teste;
  }

  double _topLeftValue(String text) {
    double topLeft = double.parse(text);
    return topLeft;
  }

  double _value;
  void _bottomLeftValue() {
    setState(() {
      _value = double.parse(bottomLeftController.text);
    });
  }

  double _topRightValue(String text) {
    double topRight = double.parse(text);
    return topRight;
  }

  double _bottomRightValue(String text) {
    double bottomRight = double.parse(text);
    return bottomRight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Border Radius Previewer"),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        backgroundColor: Colors.pink[50],
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(),
              buildTextField("Top Left", topLeftController, _topLeftValue),
              Divider(),
              buildTextField("Top Right", topRightController, _topRightValue),
              Divider(),
              buildTextField(
                  "Bottom Left", bottomLeftController, _bottomLeftValue),
              Divider(),
              buildTextField(
                  "Bottom Right", bottomRightController, _bottomRightValue),
              Container(
                  height: 150.0,
                  margin: const EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 40.0),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(testeFunction(teste1)),
                          topRight: Radius.circular(testeFunction(teste1)),
                          bottomLeft: Radius.circular(_value),
                          bottomRight: Radius.circular(25.0))),
                  child: Center(
                    child: Text(
                      "border-radius: px px px px",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ))
            ],
          ),
        ));
  }
}

Widget buildTextField(String label, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.pink),
        border: OutlineInputBorder(),
        suffixText: "px"),
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.pink, fontSize: 25.0),
    onChanged: f,
  );
}
