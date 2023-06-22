import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/species/species1.dart';
import 'package:my_app/species/species2.dart';
import 'package:my_app/species/species3.dart';
import 'package:my_app/species/species4.dart';
import 'package:my_app/species/species5.dart';
import 'package:my_app/species/species6.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart TreeBox App',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const SpeciesScreen(),
    );
  }
}

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({Key? key}) : super(key: key);

  @override
  State<SpeciesScreen> createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายพันธุ์ของมะเขือเทศพุ่มเตี้ย', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 2/3,
          children: [
          
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species1()),
                );
              },
              child: species('Siam สยาม', 'assets/images/TOM1.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species2()),
                );
              },
              child: species('Red Velvet เรด เวลเวต', 'assets/images/TOM2.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species3()),
                );
              },
              child: species('Cocoa โกโก้', 'assets/images/TOM3.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species4()),
                );
              },
              child: species('Little Bing ลิตเติ้ล บิง', 'assets/images/TOM4.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species5()),
                );
              },
              child: species('Bellatrix เบลลาทริกซ์', 'assets/images/TOM5.jpg'),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Species6()),
                );
              },
              child: species('Little Sicily ลิตเติ้ล ซิซิล', 'assets/images/TOM6.jpg'),
            ),
          
            //species('Siam สยาม', 'assets/images/TOM1.jpg'),
            //species('Red Velvet เรด เวลเวต', 'assets/images/TOM2.jpg'),
            //species('Cocoa โกโก้', 'assets/images/TOM3.jpg'),
            //species('Little Bing ลิตเติ้ล บิง', 'assets/images/TOM4.jpg'),
            //species('Bellatrix เบลลาทริกซ์', 'assets/images/TOM5.jpg'),
            //species('Little Sicily ลิตเติ้ล ซิซิล', 'assets/images/TOM6.jpg'),
          ],
        ),
      ),
    );
  }

  species(String title, String img) => Container(
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
          blurRadius: 5
        )
      ]
    ),
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
