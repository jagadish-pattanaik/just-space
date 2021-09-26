import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrackIIS extends StatefulWidget {

  @override
  TrackIISState createState() => TrackIISState();
}

class TrackIISState extends State<TrackIIS> {
  String data = '';

  @override
  void initState() {
    super.initState();
    _getIISLocation();
  }

  void _getIISLocation() async {
    // http://api.open-notify.org/astros.json
    var response = await http.get(Uri.parse('https://cors-anywhere.herokuapp.com/http://api.open-notify.org/astros.json'));
    var jsonResponse = json.decode(response.body);
    setState(() {
      data = "Longitude - ${jsonResponse['iss_position']['longitude']}\nLatitude - ${jsonResponse['iss_position']['latitude']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Humans In Space'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}