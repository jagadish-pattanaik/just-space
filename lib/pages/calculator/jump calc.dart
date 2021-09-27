import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:just_space/animation/stars.dart';
import 'package:just_space/model/planet_model.dart';
import 'package:just_space/utils/constants.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class JumpCalculator extends StatefulWidget {
  final Size screenSize;

  const JumpCalculator({Key key, @required this.screenSize}) : super(key: key);

  @override
  _JumpCalculatorState createState() => _JumpCalculatorState();
}

class _JumpCalculatorState extends State<JumpCalculator> with TickerProviderStateMixin {
  TextEditingController userInput = new TextEditingController();
  String result;
  int preIndex = 0;

  Size screenSize;

  List<Star> listStar;
  int numStars;
  AnimationController animControlStar;
  Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4, sizeAnimStar, rotateAnimStar;
  static const double durationSlowMode = 2.0;

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    timeDilation = durationSlowMode;
    return Scaffold(
      backgroundColor: gradientEndColor,
      resizeToAvoidBottomInset: false,
      body:Stack(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Jump Calculator',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 44,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "How high can you jump on other planets?",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 24,
                                  color: const Color(0x7cdbf1ff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 550,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                              children: [
                                result != null && userInput.text != ''? Text(result + ' Meters',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 44,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ) : Container(),
                                result != null && userInput.text != '' ? SizedBox(
                                  height: 25,
                                ) : Container(),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: userInput,
                                  onChanged: (val) {
                                    if (userInput.text != null && userInput.text != '') {
                                      setState(() {
                                        double x = double.tryParse(userInput.text);
                                        double y = double.tryParse(planets[preIndex].surfaceGravity.toString());
                                        double r = x/y;
                                        result =  r.toStringAsFixed(1);
                                      });
                                    } else {
                                      setState(() {
                                        result = '';
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'How high can you jump on Earth in meters?',
                                    fillColor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  height: 375,
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Swiper(
                                    itemCount: planets.length,
                                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                                    layout: SwiperLayout.STACK,
                                    onIndexChanged: (i) {
                                      if (userInput.text != null && userInput.text != '') {
                                        setState(() {
                                          preIndex = i;
                                          double x = double.tryParse(userInput.text);
                                          double y = double.tryParse(planets[i].surfaceGravity.toString());
                                          double r = x/y;
                                          result =  r.toStringAsFixed(1);
                                        });
                                      } else {
                                        setState(() {
                                          result = '';
                                        });
                                      }
                                    },
                                    pagination: SwiperPagination(
                                      builder:
                                      DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                SizedBox(height: 100),
                                                Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(32),
                                                  ),
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(32.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        SizedBox(height: 100),
                                                        Text(
                                                          planets[index].name,
                                                          style: TextStyle(
                                                            fontFamily: 'Avenir',
                                                            fontSize: 44,
                                                            color: const Color(0xff47455f),
                                                            fontWeight: FontWeight.w900,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Hero(
                                              tag: planets[index].position,
                                              child: Image.asset(planets[index].iconImage),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    IconButton(
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
