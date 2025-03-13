
import 'package:flutter/material.dart';

class LengthScreen extends StatelessWidget {
  const LengthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text('LENGTH',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('from',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 22,


                            fontWeight: FontWeight.bold
                        ),),

                      SizedBox(width: 140,),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'To',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                Length(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  String _from = 'cm';
  String _to = 'feet';
  double _value = 0;
  double _answer = 0;



  void convert(String from, String to, double value) async {
    if (value == 0.0) {
      return;
    }
    if (from == 'cm' && to == 'feet') {
      setState(() {
        _answer = value * 0.0328084;
      });
    }
    if (from == 'feet' && to == 'cm') {
      setState(() {
        _answer = value / 0.0328084;
      });
    }
    if (from == 'inches' && to == 'cm') {
      setState(() {
        _answer = value * 2.54;
      });
    }
    if (from == 'cm' && to == 'inches') {
      setState(() {
        _answer = value / 2.54;
      });
    }
    if (from == 'feet' && to == 'inches') {
      setState(() {
        _answer = value * 12;
      });
    }
    if (from == 'inches' && to == 'feet') {
      setState(() {
        _answer = value / 12;
      });
    }
    if (from == to) {
      setState(() {
        _answer = value;
      });
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            DropdownButton(
              value: _from,
              items: [
                DropdownMenuItem(
                  value: 'inches',
                  child: Text(
                    "Inches",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownMenuItem(
                  value: 'feet',
                  child: Text(
                    "Feet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownMenuItem(
                  value: 'cm',
                  child: Text(
                    "Centimeters",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              hint: Text('Length Scale'),
              onChanged: (from) {
                setState(() {
                  _from = from!;
                });
              },
            ),
            SizedBox(
              width: 100,
            ),
            DropdownButton(
              value: _to,
              items: [
                DropdownMenuItem(
                  value: 'inches',
                  child: Text(
                    "Inches",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownMenuItem(
                  value: 'feet',
                  child: Text(
                    "Feet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownMenuItem(
                  value: 'cm',
                  child: Text(
                    "Centimeters",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              hint: Text('Length Scale'),
              onChanged: (to) {
                setState(() {
                  _to = to!;
                });
              },
            )
          ],
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.30,
              child: TextField(
                cursorHeight: 20,
                onSubmitted: (value) =>
                    convert(_from, _to, double.parse(value)),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: '  Enter value...',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
                onChanged: (value) {
                  setState(() {
                    _value = double.tryParse(value)!;
                  });
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              _from,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              '=',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.grey,
              ),
              width: MediaQuery.of(context).size.width * 0.21,
              child: Text(
                _answer.toStringAsFixed(3),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _to == 'inches' ? 'inch' : _to,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black!),
          ),
          onPressed: () => convert(_from, _to, _value),
          child: Text(
            'Convert',
            style:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),


      ],
    );
  }
}


