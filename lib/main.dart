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
                  new BoxDecoration(color: Color.fromARGB(255, 115, 16, 145)),
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
                          "25.0",
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
                            text: "Condition :",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                            children: <TextSpan>[
                          TextSpan(
                            text: " Overweight",
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
                        color: Color.fromARGB(255, 115, 16, 145),
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
                          color: Color.fromARGB(255, 115, 16, 145),
                          fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: " 170",
                          style: TextStyle(
                              color: Color.fromARGB(255, 115, 16, 145),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Slider(
                      value: _height,
                      min: 0,
                      max: 250,
                      onChanged: (height) {
                        setState(() {
                          _height = height;
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Weight :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 115, 16, 145),
                          fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: " 56",
                          style: TextStyle(
                              color: Color.fromARGB(255, 115, 16, 145),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
