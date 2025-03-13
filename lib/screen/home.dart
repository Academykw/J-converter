import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('J CONVERTER',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        centerTitle: true,
      ),


      body: Column(

        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              height: 40,
              color: Colors.white70,
              child: Marquee(
                  text: '  Welcome To Jconverter, your best app for converting lenght and temperature.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20,
              velocity: 30,
              pauseAfterRound: Duration(seconds: 1),
              showFadingOnlyWhenScrolling: true,
              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,),

            ),
          ),
          //row 1
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/length');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 2),
                            ),
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(0, 10,0, 2),
                          child: ClipRRect(
                             borderRadius: BorderRadius.circular(15),
                            child: Image(
                              width: 200,
                              height: 154,
                              image: AssetImage('assets/images/length.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),),
                    Text('Length',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20,),


          //row2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/temp');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10,0, 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          width: 200,
                          height: 154,
                          image: AssetImage('assets/images/temperature.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),),
                  Text('Temperature',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
