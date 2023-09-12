import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isGroup1Selected = false;
  bool _isGroup2Selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: const Text(
          'Smart TreeBox',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text('เลือกยารักสาโรค'),
            children: <Widget>[
              ListTile(
                title: Text('ยารักสาโรคกลุ่มที่ 1'),
                onTap: () {
                  setState(() {
                    _isGroup1Selected = !_isGroup1Selected;
                    _isGroup2Selected = false;
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('ยารักสาโรคกลุ่มที่ 2'),
                onTap: () {
                  setState(() {
                    _isGroup2Selected = !_isGroup2Selected;
                    _isGroup1Selected = false;
                  });
                },
              ),


              Center(
                child: Column(
                  children: [
                    if (_isGroup1Selected)
                      ElevatedButton(
                        onPressed: () {
                          //  ดำเนินการเมื่อปุ่ม "ให้ยากลุ่มที่ 1" ถูกคลิก
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // สีพื้นหลังของปุ่ม
                        foregroundColor: Colors.white, // สีของตัวอักษร
  ),
                        child: Text('ให้ยากลุ่มที่ 1'),
                      ),
                    if (_isGroup2Selected)
                      ElevatedButton(
                        onPressed: () {
                          //  ดำเนินการเมื่อปุ่ม "ให้ยากลุ่มที่ 2" ถูกคลิก
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // สีพื้นหลังของปุ่ม
                        foregroundColor: Colors.white, // สีของตัวอักษร
                      ),
                        child: Text('ให้ยากลุ่มที่ 2'),
                      ),
                  ],
                ),
              ),
            ],
            onExpansionChanged: (bool expanded) {},
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
