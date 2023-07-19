import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/diseases/diseases1.dart';

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
      home: const Diseases6(),
    );
  }
}

class Diseases6 extends StatefulWidget {
  const Diseases6({Key? key}) : super(key: key);

  @override
  State<Diseases6> createState() => _Diseases6State();
}

class _Diseases6State extends State<Diseases6> {
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
                MaterialPageRoute(builder: (context) => Diseases1()),
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
                "assets/images/diseases6.jpg",
                height: MediaQuery.of(context).size.height / 2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "โรคราแป้ง ชื่ออื่น ( Powdery mildew)",
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
                      "สาเหตุของโรค : เกิดจากเชื้อรา Oidiopsis sp.",
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
                      "อาการที่มองเห็นด้านบนใบจะปรากฏเป็นจุดสีเหลือง จุดเหลืองนี้จะขยายออก และจำนวนจุดบนใบจะมีมากขึ้น เมื่อโรคระบาดรุนแรงขึ้น จนบางครั้งมองเห็นเป็นปื้นสี เหลืองด้านบนใบ ตรงกลางปื้นเหลืองนี้อาจจะมีสีน้ำตาล ต่อมาใบเปลี่ยนเป็นสีเหลือง ทางด้านใต้ใบ ตรงบริเวณที่แสดงอาการปื้นเหลือง จะมีผงละเอียดคล้ายผงแป้งเกาะอยู่ บาง ๆ มองเห็นได้ไม่ชัดเจนนัก เมื่ออาการรุนแรงมากขึ้นใบจะเหลือง จากส่วนล่างของ ต้นไปยังส่วนบนและใบที่เหลืองนี้จะร่วงหลุดไป ในสภาพอากาศเย็นบางครั้งจะพบผงสี ขาวเกิดขึ้นบนใบได้ และลุกลามไปเกิดที่กิ่งได้",
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
                      "โรคนี้มักพบในระยะเก็บผลผลิต ทำให้ต้นโทรมเร็วกว่าปกติ",            
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
                      "1.ลดความชื้นบริเวณโคนต้นหรือในทรงพุ่ม โดยการตัดแต่งกิ่ง",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "2.เมื่อพบโรคควรพ่นด้วยสารป้องกันกำจัดโรคพืชบางชนิดเช่น กำมะถัน",
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