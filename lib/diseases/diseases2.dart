import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/diseases/diseases3.dart';

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
      home: const Diseases2(),
    );
  }
}

class Diseases2 extends StatefulWidget {
  const Diseases2({Key? key}) : super(key: key);

  @override
  State<Diseases2> createState() => _Diseases2State();
}

class _Diseases2State extends State<Diseases2> {
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
                MaterialPageRoute(builder: (context) => Diseases3()),
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
                "assets/images/diseases2.jpg",
                height: MediaQuery.of(context).size.height / 2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "โรคใบจุด ชื่ออื่น (Leaf spot)",
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
                      "สาเหตุของโรค : เกิดจากเชื้อรา Corynespora cassiicola",
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
                      "อาการของโรคนี้ใกล้เคียงกับโรคใบจุดวงมาก แต่แผลบนใบมักมีขนาดเล็ก การ ขยาย ตัวของโรคใบจุดเกิดเป็นวงไม่ค่อยชัดเจน และแผลมักมีสีเหลืองล้อมรอบ อาการ บนผลเป็นจุดเล็ก ๆ กระจายอยู่ทั่วไป แผลสีครีม หรือน้ำตาลอ่อน",
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
                      "โรคนี้พบระบาดมากในภาคเหนือโดยเฉพาะถ้ามีความชื้นสูงหรือมีฝนตก โรคจะระบาดอย่างรวดเร็ว ใบที่เป็นโรคมาก ๆ จะร่วงหลุดไป",
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
                      "1.พยายามรักษาความชื้นในแปลงปลูกอย่าให้สูงมากเกินไป",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "2.เมื่อพบโรค พ่นด้วยสารป้องกันกำจัดโรคพืช เช่น เบนโนมิล คาร์เบนดาซิม",
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
