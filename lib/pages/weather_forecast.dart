import 'package:flutter/material.dart';

class MainWeatherScreen extends StatefulWidget {
  const MainWeatherScreen({Key? key}) : super(key: key);

  @override
  State<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends State<MainWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00BFA5),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff00BFA5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image(
                            height: 20,
                            width: 20,
                            color: Colors.white,
                            image: AssetImage('assets/icons/menu_icon.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Colombo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff00BFA5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mostly sunny',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Stack(
                  children: [
                    Text(
                      '27° ',
                      style: TextStyle(
                        fontSize: 150,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60.0, top: 60),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            height: 150,
                            image: AssetImage('assets/icons/sunny_icon.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Sunday, 10 September | 10:00 AM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Color(0xff004D40),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Precipitation padding
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 8),
                        child: Column(
                          children: [
                            Image(
                              height: 40,
                              image:
                                  AssetImage('assets/icons/umbrella_icon.png'),
                            ),
                            Text(
                              '30°',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Precipitation',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

                      // Humidity padding
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 8),
                        child: Column(
                          children: [
                            Image(
                              height: 40,
                              image: AssetImage('assets/icons/drop_icon.png'),
                            ),
                            Text(
                              '20°',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

                      // Wind speed padding
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 8, right: 8),
                        child: Column(
                          children: [
                            Image(
                              height: 40,
                              image: AssetImage('assets/icons/wind_icon.png'),
                            ),
                            Text(
                              '8km/h',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Wind Speed',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      '7-Day forecasts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //cloud
                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '10 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloud_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '23°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),

                      //cloudy
                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '11 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloudy_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '21°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),

                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '12 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image: AssetImage(
                                    'assets/icons/cloud_sun_drops_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '19°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 13,
                      ),

                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '01 PM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloudy_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '18°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 13,
                      ),

                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '02 PM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloudy_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '18°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 13,
                      ),

                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '03 PM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloudy_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '26°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 13,
                      ),

                      Container(
                        height: 150,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff004D40),
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 18.0, left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  '04 PM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                height: 40,
                                image:
                                    AssetImage('assets/icons/cloudy_icon.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '25°',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Other Cities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      '+',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                // SingleChildScrollView(
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 70,
                //         width: 250,
                //         decoration: BoxDecoration(
                //           color: Color(0xff004D40),
                //           borderRadius: BorderRadius.circular(19),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: const [
                //               Image(
                //                 height: 40,
                //                 image:
                //                     AssetImage('assets/icons/cloudy_icon.png'),
                //               ),
                //               Center(
                //                 child: Column(
                //                   children: const [
                //                     Center(
                //                       child: Text(
                //                         'India',
                //                         style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                     ),
                //                     Column(
                //                       children: [
                //                         Center(
                //                           child: Text(
                //                             'Sunny',
                //                             style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.only(top: 18.0),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Center(
                //                       child: Padding(
                //                         padding: EdgeInsets.only(bottom: 8.0),
                //                         child: Center(
                //                           child: Text(
                //                             '27°',
                //                             style: TextStyle(
                //                               fontSize: 30,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: 70,
                //         width: 300,
                //         decoration: BoxDecoration(
                //           color: Color(0xff004D40),
                //           borderRadius: BorderRadius.circular(19),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: const [
                //               Image(
                //                 height: 40,
                //                 image:
                //                     AssetImage('assets/icons/cloudy_icon.png'),
                //               ),
                //               Center(
                //                 child: Column(
                //                   children: const [
                //                     Center(
                //                       child: Text(
                //                         'India',
                //                         style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                     ),
                //                     Column(
                //                       children: [
                //                         Center(
                //                           child: Text(
                //                             'Sunny',
                //                             style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.only(top: 18.0),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Center(
                //                       child: Padding(
                //                         padding: EdgeInsets.only(bottom: 8.0),
                //                         child: Center(
                //                           child: Text(
                //                             '27°',
                //                             style: TextStyle(
                //                               fontSize: 30,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
