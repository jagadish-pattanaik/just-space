import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_space/model/isro_model.dart';
import 'package:just_space/pages/isro/isro_details.dart';
import '../../utils/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IsroPage extends StatefulWidget {
  @override
  _IsroPageState createState() => _IsroPageState();
}

class _IsroPageState extends State<IsroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text('ISRO',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Indian Space Research Organisation',
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
                height: 500,
                padding: const EdgeInsets.only(left: 20),
                child: Swiper(
                  itemCount: isroInfo.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                    DotSwiperPaginationBuilder(activeSize: 20, space: 7),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => IsroDetails(
                              isroInfo: isroInfo[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
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
                                      Text(
                                        isroInfo[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 40,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Text(
                                        isroInfo[index].description,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
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
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
