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
    // http://api.open-notify.org
    var response = await http.get(Uri.parse('https://crossoriginserver.azurewebsites.net/http://api.open-notify.org/iss-now.json'));
    var jsonResponse = json.decode(response.body);
    setState(() {
      data = "Longitude - ${jsonResponse['iss_position']['longitude']}\nLatitude - ${jsonResponse['iss_position']['latitude']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track ISS'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
