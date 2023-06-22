import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/species/speciesAll.dart';
import 'package:my_app/diseases/diseasesAll.dart';

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
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart TreeBox',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.grey,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward),
            color: Colors.grey,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 120,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            )
                          ]
                        ),
                        child: Image.asset(
                          "assets/images/diseases1.jpg",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      height: 60,
                      width: 125,
                      decoration: BoxDecoration(
                        //color: Colors.greenAccent[100]!.withOpacity(0.5),
                        color: status == 'away' ? Colors.greenAccent[100]!.withOpacity(0.5) : Colors.amber[100]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          //width: 2,
                    ),
                      ),
                      child: Center(
                        child: Text(
                          'ไม่พบโรค',
                          style: TextStyle(
                            //color: Colors.green,
                            color: status == 'away' ? Colors.green : Colors.amber,
                            fontWeight: FontWeight.bold,
                                                      ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  child: myhome('สายพันธุ์ของมะเขือเทศ', 'assets/images/t_1.jpg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DiseasesScreen()),
                    );
                  },
                  child: myhome('โรคของมะเขือเทศ', 'assets/images/t_2.jpg'),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
  
  myhome(String title, String img) => Container(
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
