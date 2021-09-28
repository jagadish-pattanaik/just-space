import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:just_space/animation/stars.dart';
import 'package:http/http.dart' as http;
import 'package:just_space/utils/constants.dart';
import 'launch_details.dart';

class UpcomingLaunches extends StatefulWidget {
  final Size screenSize;

  const UpcomingLaunches({Key key, @required this.screenSize}) : super(key: key);

  @override
  UpcomingLaunchesState createState() => UpcomingLaunchesState();
}

class UpcomingLaunchesState extends State<UpcomingLaunches> with TickerProviderStateMixin {
  List<Widget> upcomingLaunches = [];

  Size screenSize;

  List<Star> listStar;
  int numStars;
  AnimationController animControlStar;
  Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4, sizeAnimStar, rotateAnimStar;
  static const double durationSlowMode = 2.0;

  @override
  void initState() {
    super.initState();
    upcomingLaunches.add(
      Padding(
        padding: EdgeInsets.only(top: widget.screenSize.width / 2),
        child: Center(
          child: CircularProgressIndicator(
            color: CupertinoColors.activeGreen,
          ),
        ),
      ),
    );
    setState(() {});
    _getUpcomingLaunches();

    screenSize = widget.screenSize;

    listStar = [];
    numStars = 30;

    // Star
    animControlStar = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));
    fadeAnimStar1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.0, 0.5)));
    fadeAnimStar1.addListener(() {
      setState(() {});
    });
    fadeAnimStar2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.5, 1.0)));
    fadeAnimStar2.addListener(() {
      setState(() {});
    });
    fadeAnimStar3 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.0, 0.5)));
    fadeAnimStar3.addListener(() {
      setState(() {});
    });
    fadeAnimStar4 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.5, 1.0)));
    fadeAnimStar4.addListener(() {
      setState(() {});
    });
    sizeAnimStar = new Tween(begin: 0.0, end: 9.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.0, 0.5)));
    sizeAnimStar.addListener(() {
      setState(() {});
    });
    rotateAnimStar = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(
        parent: animControlStar, curve: new Interval(0.0, 0.5)));
    rotateAnimStar.addListener(() {
      setState(() {});
    });

    animControlStar.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlStar.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControlStar.forward();
      }
    });

    for (int i = 0; i < numStars; i++) {
      listStar.add(new Star(
          left: new Random().nextDouble() * screenSize.width,
          top: Random().nextDouble() * screenSize.height,
          extraSize: Random().nextDouble() * 2,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }

    animControlStar.forward();
  }

  @override
  void dispose() {
    animControlStar.dispose();
    super.dispose();
  }

  Widget buildStar(double left, double top, double extraSize, double angle, int typeFade) {
    return new Positioned(
      child: new Container(
        child: new Transform.rotate(
          child: new Opacity(
            child: new Icon(
              Icons.star,
              color: Colors.white,
              size: sizeAnimStar.value + extraSize,
            ),
            opacity: (typeFade == 1)
                ? fadeAnimStar1.value
                : (typeFade == 2) ? fadeAnimStar2.value : (typeFade == 3) ? fadeAnimStar3.value : fadeAnimStar4.value,
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
        width: 10.0,
        height: 10.0,
      ),
      left: left,
      top: top,
    );
  }

  Widget buildGroupStar() {
    List<Widget> list = [];
    for (int i = 0; i < numStars; i++) {
      list.add(
          buildStar(listStar[i].left, listStar[i].top, listStar[i].extraSize, listStar[i].angle, listStar[i].typeFade));
    }

    return new Stack(
      children: <Widget>[
        list[0],
        list[1],
        list[2],
        list[3],
        list[4],
        list[5],
        list[6],
        list[7],
        list[8],
        list[9],
        list[10],
        list[11],
        list[12],
        list[13],
        list[14],
        list[15],
        list[16],
        list[17],
        list[18],
        list[19],
        list[20],
        list[21],
        list[22],
        list[23],
        list[24],
        list[25],
        list[26],
        list[27],
        list[28],
        list[29],
      ],
    );
  }

  void _getUpcomingLaunches() async {
    var jsonData = {};
    try {
      jsonData = json.decode((await http.get(Uri.parse('https://crossoriginserver.azurewebsites.net/ll.thespacedevs.com/2.1.0/launch/upcoming?format=json'))).body);
    } catch (error) {
      jsonData = json.decode((await http.get(Uri.parse('https://ll.thespacedevs.com/2.1.0/launch/upcoming?format=json'))).body);
    }
    setState(() {
      upcomingLaunches.clear();
      for (var launch in jsonData['results']) {
        upcomingLaunches.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a, b) => LaunchDetails(title: launch['name'], desc: launch['status']['description'],)
                    )
                );
              },
              child: Stack(
                  children: <Widget>[
                    Column(
                        children: [
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(launch['name'],
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 30,
                                      color: const Color(0xff47455f),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(launch['status']['description'],
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 18,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: secondaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: secondaryTextColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ]
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = durationSlowMode;
    return Scaffold(
        backgroundColor: gradientEndColor,
        body: Stack(
            children: [
        Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7])),
    child: buildGroupStar(),
    ),
    SafeArea(
      child: Stack(
      children: <Widget>[
        SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 0, left: 32, right: 32),
              child: Column(
                children: <Widget>[
                  Text(
                    'Upcoming Launches',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: upcomingLaunches,
              ),
            ),
          ],
        ),
      ),
      IconButton(
        padding: EdgeInsets.only(left: 10),
        icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ]),
    ),
          ]),
    );
  }
}
