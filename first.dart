import 'dart:ui';
import 'package:flutter/material.dart';
import 'second.dart';
import 'test.dart';
import 'package:mushroom_chamber/barandbutton/button.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEAD2),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFEAD2),
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'lib/images/headdang.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          'Chamber1',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Itim',
            color: Color(0xFF886868),
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
          child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.06, -0.98),
            child: Container(
              width: 343.6,
              height: 4.8,
              decoration: BoxDecoration(
                color: Color(0xFF886868),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.89),
            child: Container(
              width: 361.5,
              height: 63.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 168, 131),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                    child: Text(
                      'Your chamber',
                      style: TextStyle(
                        fontFamily: 'Itim',
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.78, 0.34),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(200, 0, 0, 0),
                      child: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          color: Colors.white,
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const SecondRoute()))),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Generated code for this Icon Widget...
          Align(
            alignment: AlignmentDirectional(0.95, 0.94),
            child: IconButton(
                icon: const Icon(Icons.add_circle),
                color: Color(0xFF886868),
                iconSize: 50,
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()))),
          ),
        ],
      )),
    );
  }
}
