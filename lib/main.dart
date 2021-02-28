import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EU2US',
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Colors.lightBlue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String euDropdownValue;
  String usDropdownValue;

  double showResult;

  List euUnits = ['kg', 'cm', 'm', 'km', 'ml', 'l', '°C'];
  List usUnits = ['lb', 'in', 'ft', 'mi', 'oz', 'gal', '°F'];

  final _euController = TextEditingController();
  final _usController = TextEditingController();

  void _convertUnits() {
    if (euDropdownValue.isEmpty || usDropdownValue.isEmpty) {
      return;
    }
    if (_euController.text.isEmpty && _usController.text.isEmpty) {
      return;
    }
    if (_euController.text.isNotEmpty && _usController.text.isNotEmpty) {
      return;
    }
    if (_euController.text.isNotEmpty && _usController.text.isEmpty) {
      final _euNumber = double.parse(_euController.text);
      switch (euDropdownValue) {
        case 'kg':
          {
            showResult = _euNumber * 2.205;
            break;
          }
        case 'cm':
          {
            switch (usDropdownValue) {
              case 'in':
                {
                  showResult = _euNumber * 0.393;
                  break;
                }
              case 'ft':
                {
                  showResult = _euNumber * 0.032;
                  break;
                }
              case 'mi':
                {
                  showResult = _euNumber * 0.0000062137;
                  break;
                }
            }
            break;
          }
        case 'm':
          {
            switch (usDropdownValue) {
              case 'in':
                {
                  showResult = _euNumber * 39.370;
                  break;
                }
              case 'ft':
                {
                  showResult = _euNumber * 3.281;
                  break;
                }
              case 'mi':
                {
                  showResult = _euNumber * 0.0006213712;
                  break;
                }
            }
            break;
          }
        case 'km':
          {
            switch (usDropdownValue) {
              case 'in':
                {
                  showResult = _euNumber * 39370.08;
                  break;
                }
              case 'ft':
                {
                  showResult = _euNumber * 3280.84;
                  break;
                }
              case 'mi':
                {
                  showResult = _euNumber * 0.62;
                  break;
                }
            }
            break;
          }
        case 'ml':
          {
            switch (usDropdownValue) {
              case 'oz':
                {
                  showResult = _euNumber * 0.0338;
                  break;
                }
              case 'gal':
                {
                  showResult = _euNumber * 0.000264172;
                  break;
                }
            }
            break;
          }
        case 'l':
          {
            switch (usDropdownValue) {
              case 'oz':
                {
                  showResult = _euNumber * 33.814;
                  break;
                }
              case 'gal':
                {
                  showResult = _euNumber * 0.264;
                  break;
                }
            }
            break;
          }
        case '°C':
          {
            showResult = ((_euNumber / 5) * 9) + 32;
            break;
          }
      }
      _usController.text = '$showResult';
    }
    if (_euController.text.isEmpty && _usController.text.isNotEmpty) {
      final _usNumber = double.parse(_usController.text);
      switch (usDropdownValue) {
        case 'lb':
          {
            showResult = _usNumber / 2.205;
            break;
          }
        case 'in':
          {
            switch (usDropdownValue) {
              case 'cm':
                {
                  showResult = _usNumber / 0.393;
                  break;
                }
              case 'm':
                {
                  showResult = _usNumber / 0.032;
                  break;
                }
              case 'km':
                {
                  showResult = _usNumber / 0.0000062137;
                  break;
                }
            }
            break;
          }
        case 'ft':
          {
            switch (usDropdownValue) {
              case 'cm':
                {
                  showResult = _usNumber / 39.370;
                  break;
                }
              case 'm':
                {
                  showResult = _usNumber / 3.281;
                  break;
                }
              case 'km':
                {
                  showResult = _usNumber / 0.0006213712;
                  break;
                }
            }
            break;
          }
        case 'mi':
          {
            switch (usDropdownValue) {
              case 'cm':
                {
                  showResult = _usNumber / 39370.08;
                  break;
                }
              case 'm':
                {
                  showResult = _usNumber / 3280.84;
                  break;
                }
              case 'km':
                {
                  showResult = _usNumber / 0.62;
                  break;
                }
            }
            break;
          }
        case 'oz':
          {
            switch (usDropdownValue) {
              case 'ml':
                {
                  showResult = _usNumber / 0.0338;
                  break;
                }
              case 'l':
                {
                  showResult = _usNumber / 0.000264172;
                  break;
                }
            }
            break;
          }
        case 'gal':
          {
            switch (usDropdownValue) {
              case 'ml':
                {
                  showResult = _usNumber / 33.814;
                  break;
                }
              case 'l':
                {
                  showResult = _usNumber / 0.264;
                  break;
                }
            }
            break;
          }
        case '°F':
          {
            showResult = ((_usNumber - 32) * 5) / 9;
            break;
          }
      }
      _euController.text = '$showResult';
    }
  }

  final PreferredSizeWidget appBar = AppBar(
    title: Text('Convertor'),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: screenHeight / 10 * 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/eu_flag.png',
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          'EU',
                          style: TextStyle(fontSize: 42),
                        ),
                        DropdownButton<String>(
                          hint: Text('Unit'),
                          value: euDropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          onChanged: (String newValue) {
                            setState(() {
                              euDropdownValue = newValue;
                            });
                          },
                          items: euUnits.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          child: TextField(
                            decoration: new InputDecoration(
                              labelText: "Enter the value",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            style: TextStyle(fontSize: 19),
                            controller: _euController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          width: screenWidth / 3,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight / 5 * 2,
                    width: 1.0,
                    color: Colors.black,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/us_flag.jpg',
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          'US',
                          style: TextStyle(fontSize: 42),
                        ),
                        DropdownButton<String>(
                          hint: Text('Unit'),
                          value: usDropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          onChanged: (String newValue) {
                            setState(() {
                              usDropdownValue = newValue;
                            });
                          },
                          items: usUnits.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          child: TextField(
                            decoration: new InputDecoration(
                              labelText: "Enter the value",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            style: TextStyle(fontSize: 19),
                            controller: _usController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          width: screenWidth / 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight / 10,
              child: IconButton(
                onPressed: _convertUnits,
                icon: Icon(Icons.compare_arrows_rounded),
                tooltip: 'Convert',
              ),
            ),
            Container(
              height: screenHeight / 10 * 4,
              width: 1.0,
              color: Colors.black,
            ),
          ],
        ),
        margin: EdgeInsets.only(
          top: 10,
        ),
      ),
    );
  }
}
