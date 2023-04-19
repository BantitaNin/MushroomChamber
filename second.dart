import 'package:flutter/material.dart';
import 'first.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import 'package:mushroom_chamber/barandbutton/tempandhumid.dart';
import 'package:mushroom_chamber/barandbutton/button.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFEAD2),
        automaticallyImplyLeading: false,
        leading: Image.network(
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/apc3q2y0ewea/logo.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          'Chamber1',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF886868),
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: const Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEAD2),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            barhumid(),
            button(),

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
              alignment: AlignmentDirectional(-0.81, -0.71),
              child: Stack(
                children: [
                  if (temp > 10 && humidity > 10) ...[
                    Container(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/cf/77/de/cf77deb4c6d4023ff4362b9e32888ebc.gif'),
                      ),
                    ),
                  ] else ...[
                    Container(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/9b/09/87/9b09879df7b23227d8fd88a00aa1f398.gif'),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.7, -0.84),
              child: Container(
                width: 144.9,
                height: 27.6,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEAD2),
                ),
                child: Row(
                  children: [
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontFamily: 'Itim',
                        color: Color(0xFF886868),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional(0.7, -0.56),
              child: Container(
                width: 144.9,
                height: 27.6,
                decoration: BoxDecoration(
                  color: Color(0xFFFFEAD2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temperature',
                      style: TextStyle(
                        fontFamily: 'Itim',
                        color: Color(0xFF886868),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Generated code for this Text Widget...
            Align(
              alignment: AlignmentDirectional(-0.62, -0.09),
              child: Text(
                'Light status',
                style: TextStyle(
                  fontFamily: 'Itim',
                  color: Color(0xFF886868),
                  fontSize: 20,
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional(0.95, 0.94),
              child: IconButton(
                  icon: const Icon(Icons.backspace),
                  color: Color(0xFF886868),
                  iconSize: 50,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstRoute()))),
            ),

            Align(
                alignment: AlignmentDirectional(-0.62, 0.2),
                child: Text(
                  'Humidity',
                  style: TextStyle(
                    fontFamily: 'Itim',
                    color: Color(0xFF886868),
                    fontSize: 20,
                  ),
                )),
            Align(
              alignment: AlignmentDirectional(-0.64, 0.37),
              child: Text(
                'Temperature',
                style: TextStyle(
                  fontFamily: 'Itim',
                  color: Color(0xFF886868),
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.46, -0.1),
              child: Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/25kib3m1wxyy/light_status.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
