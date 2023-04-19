import 'dart:async';
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('http://167.71.205.31:1880/show?username=test'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int humi;

  const Album({
    required this.humi,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      humi: json['humi'],
    );
  }
}

class barhumid extends StatefulWidget {
  const barhumid({super.key});

  @override
  State<barhumid> createState() => _MyAppState();
}

class _MyAppState extends State<barhumid> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 200, top: 100),
                    child: new LinearPercentIndicator(
                      width: 180,
                      animation: true,
                      lineHeight: 30.0,
                      animationDuration: 200,
                      percent: snapshot.data!.humi / 100,
                      center: Text('${snapshot.data!.humi}'),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Color(0xFFFF7373),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200, top: 190),
                    child: new LinearPercentIndicator(
                      width: 180,
                      animation: true,
                      lineHeight: 30.0,
                      animationDuration: 200,
                      percent: snapshot.data!.humi / 100,
                      center: Text('${snapshot.data!.humi}'),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Color(0xFFFF7373),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Image.network(
                height: 100,
                width: 100,
                'https://media.giphy.com/media/EPuGCJLAkCObpo5ExL/giphy.gif');
          },
        ),
      ),
    );
  }
}
