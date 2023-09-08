import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/login/NavBar.dart';
//import 'package:my_app/new/add_home.dart';
import 'package:my_app/statistics/add_statistics.dart';
import 'package:my_app/species/speciesAll.dart'; // Import the speciesAll.dart file
import 'package:my_app/diseases/diseasesAll.dart'; // Import the diseasesAll.dart file

//String SERVER = 'http://10.0.2.2'; //emulator
//String SERVER = "http://192.168.123.101";
//String SERVER = "http://192.168.1.12";
String SERVER = "http://10.50.10.26";


void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart TreeBox App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
      //home: const ButtonPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String status = 'away';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        //automaticallyImplyLeading: false,
        title: const Text(
          'Smart TreeBox',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStatisticsPage(title: "")),
                //MaterialPageRoute(builder: (context) => AddHome()),
              );
            },
            icon: Icon(Icons.add_circle_outline_sharp),
            color: Colors.grey,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        //   color: Colors.grey,
        // ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.arrow_forward),
        //     color: Colors.grey,
        //   ),
        // ],
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(10),
        //child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                color: Colors.white, // Set the background color to white
                padding: EdgeInsets.all(16.0), // Add padding for spacing
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last value',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    FutureBuilder(
                      future: Dio().get('$SERVER/tomato/getDisease.php'),
                      builder: (context, AsyncSnapshot<Response> snapshot) {
                        if (snapshot.hasData) {
                          final res = snapshot
                              .data; // return the value, it must be JSON only
                          if (res!.data.toString().isEmpty) {
                            return Text('Val Err!!');
                          } else {
                            final json = jsonDecode(res.data);
                            log('json:$json');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('disease_id = ${json[0]['disease_id']}'),
                                Text('disease_dt = ${json[0]['disease_dt']}'),
                                Text('disease_pic = ${json[0]['disease_pic']}'),
                                Text(
                                    'disease_ret1 = ${json[0]['disease_ret1']}'),
                                Text(
                                    'disease_ret2 = ${json[0]['disease_ret2']}'),
                                Text(
                                    'disease_ret3 = ${json[0]['disease_ret3']}'),
                                json[0]['disease_pic'].toString().isNotEmpty
                                    ? Center(
                                        child: Image.network(
                                          '$SERVER/tomato/images/${json[0]['disease_pic']}',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Text('Error!! ${snapshot.error}');
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: Container(
            //     height: 170,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(15),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.5),
            //           spreadRadius: 3,
            //           blurRadius: 10,
            //           offset: Offset(0, 3),
            //         ),
            //       ],
            //     ),
            //     child: Row(
            //       children: [
            //         Text(
            //   'ค่าล่าสุด',
            //   style: TextStyle(
            //     fontSize: 22.0,
            //   ),
            // ),
            // FutureBuilder(
            //   future: Dio().get('$SERVER/tomato/getDisease.php'),
            //   builder: (context, AsyncSnapshot<Response> snapshot) {
            //     if (snapshot.hasData) {
            //       final res = snapshot.data; //คืนค่ามาต้องเป็น JSON เท่านั้น
            //       if (res!.data.toString().isEmpty) {
            //         return Text('Val Err!!');
            //       } else {
            //         final json = jsonDecode(res.data);
            //         log('json:$json');
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text('disease_id = ${json[0]['disease_id']}'),
            //             Text('disease_dt = ${json[0]['disease_dt']}'),
            //             Text('disease_pic = ${json[0]['disease_pic']}'),
            //             Text('disease_ret1 = ${json[0]['disease_ret1']}'),
            //             Text('disease_ret2 = ${json[0]['disease_ret2']}'),
            //             Text('disease_ret3 = ${json[0]['disease_ret3']}'),
            //             json[0]['disease_pic'].toString().isNotEmpty
            //                 ? Center(
            //                     child: Image.network(
            //                       '$SERVER/tomato/images/${json[0]['disease_pic']}',
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.9,
            //                     ),
            //                   )
            //                 : SizedBox(),
            //           ],
            //         );
            //       }
            //     } else if (snapshot.hasError) {
            //       return Text('Error!! ${snapshot.error}');
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     height: 120,
            //     width: 150,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.5),
            //           spreadRadius: 3,
            //           blurRadius: 10,
            //           offset: Offset(0, 0),
            //         ),
            //       ],
            //     ),
            //     child: FutureBuilder<Response>(
            //       future : Dio().get('$SERVER/tomato/getDisease.php'),
            //       builder: (BuildContext context,
            //           AsyncSnapshot<Response> snapshot) {
            //         if (snapshot.connectionState ==
            //             ConnectionState.waiting) {
            //           return Center(child: CircularProgressIndicator());
            //         } else if (snapshot.hasError) {
            //           // return Text('Error!! ${snapshot.error}');
            //           print('Error!! ${snapshot.error}');
            //         return Text('Error fetching data.');
            //         } else if (snapshot.hasData) {
            //           var res = snapshot.data!.data;
            //           var json = jsonDecode(res);
            //           var imageUrl = json[0]['disease_pic'].toString();
            //           return imageUrl.isNotEmpty
            //               ? Center(
            //                   child: Image.network(
            //                     '$SERVER/tomato/images/$imageUrl',
            //                     width:
            //                         MediaQuery.of(context).size.width *
            //                             0.9,fit: BoxFit.cover,
            //                   ),
            //                 )
            //               : SizedBox();
            //         } else {
            //           return Text('No Data');
            //         }
            //       },
            //     ),

            //     // child: Image.asset(
            //     //   "assets/images/t_1.jpg",
            //     //   width: 120,
            //     //   height: 150,
            //     //   fit: BoxFit.cover,
            //     // ),
            //     // ),
            //   ),
            // ),
            // SizedBox(
            //   width: 70,
            // ),
            // Container(
            //   height: 60,
            //   width: 125,
            //   decoration: BoxDecoration(
            //     //color: Colors.greenAccent[100]!.withOpacity(0.5),
            //     color: status == 'away'
            //         ? Colors.greenAccent[100]!.withOpacity(0.5)
            //         : Colors.amber[100]!.withOpacity(0.5),
            //     borderRadius: BorderRadius.circular(10),
            //     border: Border.all(
            //       color: Colors.white,
            //       style: BorderStyle.solid,
            //       //width: 2,
            //     ),
            //   ),
            //   child: Center(
            //     child: Text(
            //       'ไม่พบโรค',
            //       style: TextStyle(
            //         //color: Colors.green,
            //         color:
            //             status == 'away' ? Colors.green : Colors.amber,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              alignment: Alignment(0, 0.5),
              height: 50,
              color: Colors.white,
              child: Text(
                'สายพันธ์ุและโรคของมะเขือเทศพุ่มเตี้ย',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpeciesScreen()),
                    );
                  },
                  child: Home('สายพันธุ์ของมะเขือเทศ', 'assets/images/t_1.jpg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiseasesScreen()),
                    );
                  },
                  child: Home('โรคของมะเขือเทศ', 'assets/images/t_2.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'ค่าล่าสุด',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            FutureBuilder(
              future: Dio().get('$SERVER/tomato/getDisease.php'),
              builder: (context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  final res = snapshot.data; //คืนค่ามาต้องเป็น JSON เท่านั้น
                  if (res!.data.toString().isEmpty) {
                    return Text('Val Err!!');
                  } else {
                    final json = jsonDecode(res.data);
                    log('json:$json');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('disease_id = ${json[0]['disease_id']}'),
                        Text('disease_dt = ${json[0]['disease_dt']}'),
                        Text('disease_pic = ${json[0]['disease_pic']}'),
                        Text('disease_ret1 = ${json[0]['disease_ret1']}'),
                        Text('disease_ret2 = ${json[0]['disease_ret2']}'),
                        Text('disease_ret3 = ${json[0]['disease_ret3']}'),
                        json[0]['disease_pic'].toString().isNotEmpty
                            ? Center(
                                child: Image.network(
                                  '$SERVER/tomato/images/${json[0]['disease_pic']}',
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('Error!! ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            // SizedBox(height: 20.0),
            // FutureBuilder(
            //   future: Dio().get('$SERVER/tomato/getLogging.php'),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       final res = snapshot.data; //คืนค่ามาต้องเป็น JSON เท่านั้น
            //       if (res!.data.toString().isEmpty) {
            //         return Text('Val Err!!');
            //       } else {
            //         final json = jsonDecode(res.data);
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text('val1 = ${json[0]['log_val1']}'),
            //             Text('val2 = ${json[0]['log_val2']}'),
            //             Text('val3 = ${json[0]['log_val3']}'),
            //             Text('val4 = ${json[0]['log_val4']}'),
            //             Text('val5 = ${json[0]['log_val5']}'),
            //             Text('val6 = ${json[0]['log_val6']}'),
            //             Text('val7 = ${json[0]['log_val7']}'),
            //             Text('val8 = ${json[0]['log_val8']}'),
            //             Text('val9 = ${json[0]['log_val9']}'),
            //           ],
            //         );
            //       }
            //     } else if (snapshot.hasError) {
            //       return Text('Error!! ${snapshot.error}');
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'เซนเซอร์',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            
Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: FutureBuilder(
    future: Dio().get('$SERVER/tomato/getLogging.php'),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        final res = snapshot.data;
        if (res!.data.toString().isEmpty) {
          return Text('Val Err!!');
        } else {
          final json = jsonDecode(res.data);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/t_1.jpg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "เซนเซอร์ความเข้มแสง",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black12,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${json[0]['log_val1']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "aaa",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      } else if (snapshot.hasError) {
        return Text('Error!! ${snapshot.error}');
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  ),
),

Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: FutureBuilder(
    future: Dio().get('$SERVER/tomato/getLogging.php'),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        final res = snapshot.data;
        if (res!.data.toString().isEmpty) {
          return Text('Val Err!!');
        } else {
          final json = jsonDecode(res.data);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/t_1.jpg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "เซนเซอร์วัดอุณหภูมิ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black12,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${json[0]['log_val2']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "aaa",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      } else if (snapshot.hasError) {
        return Text('Error!! ${snapshot.error}');
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  ),
),

Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: FutureBuilder(
    future: Dio().get('$SERVER/tomato/getLogging.php'),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        final res = snapshot.data;
        if (res!.data.toString().isEmpty) {
          return Text('Val Err!!');
        } else {
          final json = jsonDecode(res.data);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/t_1.jpg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "เซนเซอร์วัดความชื้นในดิน",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black12,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${json[0]['log_val3']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "aaa",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      } else if (snapshot.hasError) {
        return Text('Error!! ${snapshot.error}');
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  ),
),

Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: FutureBuilder(
    future: Dio().get('$SERVER/tomato/getLogging.php'),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasData) {
        final res = snapshot.data;
        if (res!.data.toString().isEmpty) {
          return Text('Val Err!!');
        } else {
          final json = jsonDecode(res.data);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/t_1.jpg",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "เซนเซอร์ความเข้มแสง",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black12,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${json[0]['log_val4']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "aaa",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      } else if (snapshot.hasError) {
        return Text('Error!! ${snapshot.error}');
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  ),
),

          ],
        ),
      ),
      //เมนูบารข้างล่าง
      // extendBody: true,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   color: Theme.of(context).colorScheme.primary,
      //   child: Padding(
      //     padding: const EdgeInsets.all(0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         IconButton(
      //           icon: const Icon(Icons.home),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.list),
      //           onPressed: () {},
      //         ),
      //         const SizedBox(width: 24),
      //         IconButton(
      //           icon: const Icon(Icons.person),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.settings),
      //           onPressed: () {},
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      //),
    );
  }

  Home(String title, String img) => Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(img, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}

