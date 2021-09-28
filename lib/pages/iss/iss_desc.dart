import 'package:flutter/material.dart';
import 'package:just_space/model/iss_desc.dart';
import 'package:just_space/model/iss_images.dart';
import '../../utils/constants.dart';

class IssDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("ISS",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'International Space Station',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                              itemCount: ISS_images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        ISS_images[index],
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }),
                        ),
                        SizedBox(height: 15),
                        Divider(color: Colors.black38),
                        SizedBox(height: 15),
                        Text(
                          ISS_desc ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10000000000,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(left: 10),
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
