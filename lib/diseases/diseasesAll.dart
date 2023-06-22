import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/diseases/diseases1.dart';
import 'package:my_app/diseases/diseases2.dart';
import 'package:my_app/diseases/diseases3.dart';
import 'package:my_app/diseases/diseases4.dart';
import 'package:my_app/diseases/diseases5.dart';
import 'package:my_app/diseases/diseases6.dart';


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
      home: const DiseasesScreen(),
    );
  }
}

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({Key? key}) : super(key: key);

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โรคที่เกิดขึ้นบ่อยของเขือเทศพุ่มเตี้ย',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 3,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases1()),
                );
              },
              child: diseases('โรคใบจุดวง', 'assets/images/diseases1.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases2()),
                );
              },
              child: diseases('โรคใบจุด', 'assets/images/diseases2.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases3()),
                );
              },
              child: diseases('โรคใบไหม้', 'assets/images/diseases3.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases4()),
                );
              },
              child: diseases('โรครากำมะหยี่', 'assets/images/diseases4.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases5()),
                );
              },
              child: diseases('โรคแห้งดำ', 'assets/images/diseases5.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Diseases6()),
                );
              },
              child: diseases('โรคราแป้ง', 'assets/images/diseases6.jpg'),
            ),

            //diseases('โรคใบจุดวง', 'assets/images/diseases1.jpg'),
            //diseases('โรคใบจุด', 'assets/images/diseases2.jpg'),
            //diseases('โรคใบไหม้', 'assets/images/diseases3.jpg'),
            //diseases('โรครากำมะหยี่', 'assets/images/diseases4.jpg'),
            //diseases('โรคแห้งดำ', 'assets/images/diseases5.jpg'),
            //diseases('โรคราแป้ง', 'assets/images/diseases6.jpg'),
          ],
        ),
      ),
    );
  }

  diseases(String title, String img) => Container(
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
