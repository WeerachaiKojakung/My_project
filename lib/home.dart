import 'dart:async';
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


String ARDUINO = "http://172.20.10.3"; //ESP32 - IP Address
//String SERVER = 'http://10.0.2.2'; //emulator
String SERVER = "http://172.20.10.5"; // hostport
// String SERVER = "http://192.168.1.12"; //หอ
// String SERVER = "http://10.50.10.26"; //มอ

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 10000), (timer) { 
      setState(() {
        
      });
    });
  }


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
          'TOMATO',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddStatisticsPage(title: "")),
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
            Container(
              alignment: Alignment(0, 0.5),
              height: 50,
              color: Colors.white,
              child: Text(
                'สายพันธ์ุและโรคของมะเขือเทศพุ่มเตี้ย',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontFamily: 'Montserrat',
                  fontSize: 18,
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
            SizedBox(height: 10), // เพิ่มระยะห่าง
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
                        Text('รูปที่ = ${json[0]['disease_id']}'),
                        Text('ป/ด/ว = ${json[0]['disease_dt']}'),
                        //Text('disease_pic = ${json[0]['disease_pic']}'),
                        Text('ชื่อโรค = ${json[0]['disease_ret1']}'),
                        //Text('disease_ret2 = ${json[0]['disease_ret2']}'),
                        //Text('disease_ret3 = ${json[0]['disease_ret3']}'),
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
                              "assets/images/Photoresistor.jpg",
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
                                      "(° C)",
                                      style: TextStyle(
                                        fontSize: 10,
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
                              "assets/images/Dht11.jpg",
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
                                      "${json[0]['log_val3']}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      "(° C)",
                                      style: TextStyle(
                                        fontSize: 10,
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
                              "assets/images/Soil.jpg",
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
                                      "${json[0]['log_val2']}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      "(° C)",
                                      style: TextStyle(
                                        fontSize: 10,
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
            ),

            //ส่งคำสั่ง
            const SizedBox(height: 20.0),
            Text(
              'ส่งคำสั่ง',
              style: TextStyle(
                fontSize: 22.0,
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Dio().get('$ARDUINO/led/on');
                        },
                        child: Text('เปิด LED'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          log('$ARDUINO/led/off');
                          await Dio().get('$ARDUINO/led/off');
                        },
                        child: Text('ปิด LED'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Dio().get('$ARDUINO/med1/on');
                        },
                        child: Text('เปิดพ่นยา #1'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Dio().get('$ARDUINO/med1/off');
                        },
                        child: Text('ปิดพ่นยา #1'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await Dio().get('$ARDUINO/med2/on');
                        },
                        child: Text('เปิดพ่นยา #2'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Dio().get('$ARDUINO/med2/off');
                        },
                        child: Text('ปิดพ่นยา #2'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
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
