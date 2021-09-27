import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HumansInSpace extends StatefulWidget {

  @override
  HumansInSpaceState createState() => HumansInSpaceState();
}

class HumansInSpaceState extends State<HumansInSpace> {
  List<Widget> humansInSpaceList = [];

  @override
  void initState() {
    super.initState();
    _getHumansInSpace();
  }

  void _getHumansInSpace() async {
    // http://api.open-notify.org/astros.json
    var jsonData = {};
    try {
      jsonData = json.decode((await http.get(Uri.parse('https://crossoriginserver.azurewebsites.net/www.howmanypeopleareinspacerightnow.com/peopleinspace.json'))).body);
    } catch (error) {
      jsonData = json.decode((await http.get(Uri.parse('https://www.howmanypeopleareinspacerightnow.com/peopleinspace.json'))).body);
    }
    setState(() {
      humansInSpaceList = [];
      for (var human in jsonData['people']) {
        humansInSpaceList.add(
          ListTile(
            title: Text(human['name']),
            subtitle: Text(human['country']),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SingleHumanPage(human /*Map<dynamic, dynamic>*/))
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
        title: Text('Humans In Space'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: humansInSpaceList,
        ),
      ),
    );
  }
}
