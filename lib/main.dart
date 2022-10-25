import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 115, 16, 145)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 70.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              decoration:
                  new BoxDecoration(color: Color.fromARGB(255, 63, 28, 97)),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BMI",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0),
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "$_bmi",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Condition : ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                            children: <TextSpan>[
                          TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]))
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Choose Data",
                    style: TextStyle(
                        color: Color.fromARGB(255, 161, 126, 10),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Height :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 138, 26),
                          fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: " $_height cm",
                          style: TextStyle(
                              color: Color.fromARGB(255, 63, 28, 97),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: Color.fromARGB(255, 9, 138, 26),
                    inactiveColor: Color.fromARGB(255, 161, 126, 10),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Weight :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 138, 26),
                          fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: " $_weight cm",
                          style: TextStyle(
                              color: Color.fromARGB(255, 63, 28, 97),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 250,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Color.fromARGB(255, 9, 138, 26),
                    inactiveColor: Color.fromARGB(255, 161, 126, 10),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Column(children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //18.5-25 = Healthy, 25-30 = Overweight, >30 = Obesity
                                _bmi = (_weight /
                                        ((_height / 100) * (_height / 100)))
                                    .round()
                                    .toInt();
                                if (_bmi >= 18.5 && _bmi <= 25) {
                                  _condition = "Normal";
                                } else if (_bmi > 25 && _bmi <= 30) {
                                  _condition = "Overweight";
                                } else if (_bmi > 30) {
                                  _condition = "Obesity";
                                } else {
                                  _condition = "Underweight";
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 63, 28, 97),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 110),
                            ),
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
