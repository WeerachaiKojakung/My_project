import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/diseases/diseases4.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
  );
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
      home: const Diseases3(),
    );
  }
}

class Diseases3 extends StatefulWidget {
  const Diseases3({Key? key}) : super(key: key);

  @override
  State<Diseases3> createState() => _Diseases3State();
}

class _Diseases3State extends State<Diseases3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'รายละเอียด',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.grey,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Diseases4()),
              );
            },
            icon: Icon(Icons.arrow_forward_ios_outlined),
            color: Colors.grey,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Image.asset(
                "assets/images/diseases3.jpg",
                height: MediaQuery.of(context).size.height / 2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "โรคใบไหม้ ชื่ออื่น (Leaf blight)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สาเหตุของโรค : เกิดจากเชื้อรา Phytophthora infestans",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "ลักษณะอาการ :",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "จะพบปรากฏอยู่บนใบส่วนล่าง ๆ ของต้นก่อน โดยเกิดเป็นจุดฉ่ำน้ำสีเขียวเข้ม เหมือน ใบถูกน้ำร้อนลวก รอยช้ำนี้จะขยายขนาดออกไปอย่างรวดเร็วทางด้านใต้ใบ โดยเฉพาะขอบ ๆ แผล จะสังเกตเห็นเส้นใยสีขาวอยู่รอบ ๆ รอยช้ำนั้น เมื่อเชื้อเจริญ มากขึ้นใบจะแห้ง อาการที่กิ่งและลำต้นเป็นแผลสีดำ อาการบนผลมีรอยช้ำเหมือนถูก น้ำร้อนลวก",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "การแพร่ระบาด :",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "โรคนี้พบระบาดมากทางภาคเหนือของประเทศไทยในฤดูหนาว เพราะ สภาพแวดล้อม เหมาะต่อการเกิดโรค โดยมีอุณหภูมิเฉลี่ย 18-28 องศาเซลเซียส และ มีความชื้นสัมพัทธ์สูงกว่า 90 % ในเขตที่อุณหภูมิต่ำและความชื้นต่ำโรคจะไม่ระบาด นอกจากมีฝนโปรยลงมาโรคจะระบาดอย่างรุนแรงและรวดเร็วภายหลังจากที่มีฝน ส่วน ของพืชที่ถูกเชื้อเข้าทำลายจะตายภายใน 1 สัปดาห์",            
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "การป้องกันกำจัด :",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "1.ถ้าปลูกมะเขือเทศแบบยกค้าง ควรตัดแต่งใบล่างให้โปร่ง",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "2.เมื่อเริ่มพบโรค ควรใช้สารป้องกันกำจัดโรคพืช เช่น คลอโรทาโลนิล เมตาแลกซิล + แมนโคเซบ พ่นให้ทั่วทั้งต้น",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
