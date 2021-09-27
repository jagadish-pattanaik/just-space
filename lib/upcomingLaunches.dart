import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpcomingLaunches extends StatefulWidget {

  @override
  UpcomingLaunchesState createState() => UpcomingLaunchesState();
}

class UpcomingLaunchesState extends State<UpcomingLaunches> {
  List<Widget> upcomingLaunches = [];

  @override
  void initState() {
    super.initState();
    _getUpcomingLaunches();
  }

  void _getUpcomingLaunches() async {
    var jsonData = {};
    try {
      jsonData = json.decode((await http.get(Uri.parse('https://crossoriginserver.azurewebsites.net/ll.thespacedevs.com/2.1.0/launch/upcoming?format=json'))).body);
    } catch (error) {
      jsonData = json.decode((await http.get(Uri.parse('https://ll.thespacedevs.com/2.1.0/launch/upcoming?format=json'))).body);
    }
    setState(() {
      upcomingLaunches = [];
      for (var launch in jsonData['results']) {
        upcomingLaunches.add(
          ListTile(
            title: Text(launch['name']),
            subtitle: Text(launch['status']['description']),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailedInfoAboutLaunch(details /*Map<dynamic, dynamic>*/))
              // );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Launches'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: upcomingLaunches,
        ),
      ),
    );
  }
}
