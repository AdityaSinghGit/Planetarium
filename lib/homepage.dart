import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:planetarium/constants.dart';
import 'package:planetarium/detail_page.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg5.png"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text(
                      "Explore",
                      // "सौर मण्डल",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 50,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Solar System",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 22,
                              color: const Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        // child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: EdgeInsets.only(left: 20),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        activeSize: 20, space: 8, size: 10),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(children: [
                            SizedBox(height: 110),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 40,
                                        color: Color(0xff47455f),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Solar System",
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 22,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Know More",
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 22,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          Image.asset(planets[index].iconImage),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
