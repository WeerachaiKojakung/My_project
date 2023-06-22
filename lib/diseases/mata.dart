import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox (height: 15),
            Padding(
              
              padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black12
                      ),
                    ),
                    
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                  ),
                  Text("รายละเอียด",
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            Image.asset(
              "assets/images/diseases1.jpg",
              height: MediaQuery.of(context).size.height / 2,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "โรคใบจุดวง",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "สาเหตุของโรค : เกิดจากเชื้อรา Alternaria solani"
                  "ลักษณะอาการ :"
                  "สังเกตได้จากใบแก่เริ่มจากเป็นจุดเล็ก ๆ สีน้ำตาล แผลค่อนข้างกลมแล้วขยาย ใหญ่ออกไป การขยายตัวของจุดจะปรากฏรอยการเจริญของแผลเป็นวงสีน้ำตาลซ้อนๆ กันออกไปถ้าเกิดบนกิ่งลักษณะแผลรียาวไปตามลำต้นสีน้ำตาลปนดำเป็นวงซ้อนๆ กันผลแก่ที่เป็นโรคแสดงอาการที่ขั้วผลเป็นแผลสีน้ำตาลดำและมีลักษณะวงแหวนเหมือนบนใบ"
                  "การแพร่ระบาด :"
                  "เชื้อสาเหตุโรคนี้สามารถติดมากับเมล็ดพันธุ์ได้ โรคนี้จะเกิดมากในสภาพที่ ความชื้นและอุณหภูมิสูง ถ้าสภาพแวดล้อมเหมาะต่อการระบาดของโรคมากๆจะทำให้อาการจุดวงขยายตัวอย่างรวดเร็วจนต่อเนื่องกันเกิดเป็นอาการใบแห้ง"

                  "การป้องกันกำจัด :"
                  "1.คลุกเมล็ดด้วยสารป้องกันกำจัดโรคพืชที่สามารถกำจัดเชื้อสาเหตุที่ติดมากับ เมล็ดพันธุ์ได้ เช่น แมนโคเซบ ไอโพรไดโอน"
                  "2. ถ้าระบาดในแปลงปลูก พ่นด้วยสารป้องกันกำจัดโรคพืชบางชนิด เช่น ไอโพร ไดโอน คลอโรทาโลนิล",
                  textAlign: TextAlign.justify,
                  style:  TextStyle(
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
    );
  }
} 