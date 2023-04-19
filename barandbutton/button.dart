import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

double temp = 27;
double humidity = 70;
double incrementtemp = 1;
bool _buttonPressed = false;
bool _loopActive = false;

class data {
  final int device_id;
  final double value;

  const data({required this.device_id, required this.value});

  factory data.fromJson(Map<String, dynamic> json) {
    return data(
      device_id: json['device_id'],
      value: json['value'],
    );
  }
}

Future<data> createAlbum(double value) async {
  final http.Response response = await http.put(
    Uri.parse('http://167.71.205.31:1880/control/humi'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'value': value, 'device_id': 1}),
  );
  if (response.statusCode == 200) {
    return data.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

class button extends StatefulWidget {
  const button({super.key});

  @override
  State<button> createState() => MyStatebuttonState();
}

class MyStatebuttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    void _increasetemp() async {
      if (_loopActive) return;
      _loopActive = true;

      while (_buttonPressed) {
        setState(() {
          temp++;
          print("temp has incresed for: ");
          print(incrementtemp);
          if (temp > 30)
            temp -= 1;
          else if (temp < 27) temp += 1;
        });

        await Future.delayed(Duration(milliseconds: 100));
      }

      _loopActive = false;
    }

    void _increasehumid() async {
      if (_loopActive) return;
      _loopActive = true;
      while (_buttonPressed) {
        setState(() {
          humidity++;
          if (humidity > 100) humidity--;
        });
        await Future.delayed(Duration(milliseconds: 100));
      }
      _loopActive = false;
    }

    void _decreasehumid() async {
      if (_loopActive) return;
      _loopActive = true;
      while (_buttonPressed) {
        setState(() {
          humidity--;
          if (humidity < 0) humidity++;
        });
        await Future.delayed(Duration(milliseconds: 100));
      }
      _loopActive = false;
    }

    void _decreasetemp() async {
      if (_loopActive) return;
      _loopActive = true;
      while (_buttonPressed) {
        setState(() {
          temp--;
          if (temp < 27) temp++;
        });
        await Future.delayed(Duration(milliseconds: 100));
      }
      _loopActive = false;
    }

    return Container(
        child: SafeArea(
            child: Stack(children: <Widget>[
      Align(
          alignment: AlignmentDirectional(0.19, 0.4),
          child: Listener(
            onPointerDown: (details) {
              _buttonPressed = true;
              _increasetemp();
            },
            onPointerUp: (details) {
              _buttonPressed = false;
            },
            child: Image.network(
                height: 50,
                width: 50,
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/59a3ynb6dijb/incrementbutton.png'),
          )),
      Align(
          alignment: AlignmentDirectional(0.19, 0.2),
          child: Listener(
            onPointerDown: (details) {
              _buttonPressed = true;
              _increasehumid();
              createAlbum(humidity);
            },
            onPointerUp: (details) {
              _buttonPressed = false;
            },
            child: Image.network(
                height: 50,
                width: 50,
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/59a3ynb6dijb/incrementbutton.png'),
          )),
      Align(
          alignment: AlignmentDirectional(0.86, 0.4),
          child: Listener(
            onPointerDown: (details) {
              _buttonPressed = true;
              _decreasetemp();
            },
            onPointerUp: (details) {
              _buttonPressed = false;
            },
            child: Image.network(
                height: 50,
                width: 50,
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/mwrmr4b4exf6/decrementbutton.png'),
          )),
      Align(
          alignment: AlignmentDirectional(0.87, 0.2),
          child: Listener(
            onPointerDown: (details) async {
              _buttonPressed = true;
              _decreasehumid();
            },
            onPointerUp: (details) {
              _buttonPressed = false;
            },
            child: Image.network(
                height: 50,
                width: 50,
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/toohead-ld527t/assets/mwrmr4b4exf6/decrementbutton.png'),
          )),
      Align(
          alignment: AlignmentDirectional(0.5, 0.37),
          child: Text(
            '$temp',
            style: TextStyle(
              fontFamily: 'Itim',
              color: Color(0xFF886868),
              fontSize: 20,
            ),
          )),
      Align(
          alignment: AlignmentDirectional(0.5, 0.19),
          child: Text(
            '$humidity',
            style: TextStyle(
              fontFamily: 'Itim',
              color: Color(0xFF886868),
              fontSize: 20,
            ),
          )),
    ])));
  }
}
