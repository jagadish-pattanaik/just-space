import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class TrackIIS extends StatefulWidget {
  @override
  TrackIISState createState() => TrackIISState();
}

class TrackIISState extends State<TrackIIS> {
  String data = '';
  List<Placemark> placemarks = [];

  @override
  void initState() {
    super.initState();
  }

  Future<Map<dynamic, dynamic>> getIISLocationData() async {
    try {
      var jsonData = json.decode((await http.get(Uri.parse(
              'https://crossoriginserver.azurewebsites.net/api.open-notify.org/iss-now.json')))
          .body);
      try {
        placemarks = await placemarkFromCoordinates(
          double.parse(jsonData['iss_position']['latitude']),
          double.parse(jsonData['iss_position']['latitude']),
        );
        debugPrint(placemarks[0].toString());
        setState(() {});
      } catch (error) {
        return {'error': error.toString()};
      }
      return jsonData;
    } catch (error) {
      var jsonData = json.decode(
          (await http.get(Uri.parse('http://api.open-notify.org/iss-now.json')))
              .body);
      try {
        placemarks = await placemarkFromCoordinates(
          double.parse(jsonData['iss_position']['latitude']),
          double.parse(jsonData['iss_position']['latitude']),
        );
        debugPrint(placemarks[0].toString());
        setState(() {});
      } catch (error) {
        return {'error': error.toString()};
      }
      return jsonData;
    }
  }

  Widget displayMap() {
    return FutureBuilder(
        future: getIISLocationData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Center(
              child: Text(data),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track ISS'),
      ),
      body: displayMap(),
    );
  }
}
