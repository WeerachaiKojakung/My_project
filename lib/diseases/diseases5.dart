import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/diseases/diseases6.dart';

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
      home: const Diseases5(),
    );
  }
}

class Diseases5 extends StatefulWidget {
  const Diseases5({Key? key}) : super(key: key);

  @override
  State<Diseases5> createState() => _Diseases5State();
}

class _Diseases5State extends State<Diseases5> {
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
                MaterialPageRoute(builder: (context) => Diseases6()),
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
                "assets/images/diseases5.jpg",
                height: MediaQuery.of(context).size.height / 2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "โรคแห้งดำ ชื่ออื่น (Leaf blight)",
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
                      "สาเหตุของโรค : เกิดจากเชื้อรา Stemphylium sp",
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
                      "เริ่มต้นจากจุดเหลี่ยมเล็กๆสีดำบนใบมะเขือเทศเมื่ออาการรุนแรงแผลขยาย ขนาดใหญ่และมีจำนวนจุดมากขึ้นเนื้อใบเปลี่ยนเป็นสีเหลืองแห้งกรอบ และดำในที่ สุดแต่ส่วนของลำต้นยังเขียวอยู่ ไม่พบอาการบนลำต้นและผล",
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
                      "เชื้อสาเหตุโรคนี้สามารถติดมากับเมล็ดพันธุ์ได้ ส่วนการระบาดในแปลงจะเกิดได้รุนแรงและรวดเร็วเมื่อมีความชื้นและอุณหภูมิสูง",            
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
                      "1.คลุกเมล็ดด้วยสารป้องกันกำจัดโรคพืชที่สามารถกำจัดเชื้อสาเหตุที่ติดมากับ เมล็ดพันธุ์ได้ เช่น แมนโคเซบ ไอโพรไดโอน",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "2.ถ้าระบาดในแปลงปลูก พ่นด้วยสารป้องกันกำจัดโรคพืชบางชนิด เช่น ไอโพร ไดโอน คลอโรทาโลนิล",
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
