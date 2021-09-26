import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:just_space/model/planet_model.dart';
import 'package:just_space/utils/constants.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  static const double _poundValue = 2.20462;
  static const String _poundUnit = 'Kg';

  TextEditingController userInput = new TextEditingController();
  String result;
  int preIndex = 0;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
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
                          Text('Weight Calculator',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 44,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "What's your weight on other planets?",
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
                          result != null && userInput.text != ''? Text(result + ' Kg',
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
                            double r = x*y;
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
                        hintText: 'Your weight on Earth in $_poundUnit?',
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
                                    double r = x*y;
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
      ),
    );
  }
}
