import 'package:flutter/material.dart';
import 'package:my_app/statistics/form_tomato.dart';


class AddStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มข้อมูลต้นมะเขือเทศและการให้ยา', style: TextStyle(color: Colors.black)),
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
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text('เพิ่มข้อมูลต้นมะเขือเทศ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TormTomatoPage()), // Replace with your actual constructor
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text('เพิ่มข้อมูลการให้ยา'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text('เพิ่มข้อมูลการให้ปุ๋ย'),
            onTap: () => null,
          ),
          Divider(),
        ],
      ),
    );
  }
}
