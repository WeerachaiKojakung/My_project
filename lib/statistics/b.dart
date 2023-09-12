import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';

class b extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลจาก Provider
    final dataProvider = Provider.of<DataProvider>(context);

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date of Planting: ${dataProvider.dateTime}'),
            Text('Cultivar: ${dataProvider.cultivar}'),
            Text('Amount Planted: ${dataProvider.amount}'),
            Text('Schools: ${dataProvider.schools}'),
            Text('Days of Planting: ${dataProvider.days}'),
          ],
        ),
      ),
    );
  }
}


// ต้องการให้ กดบันทึกข้อมูลจาก form_tomato.dart 
// บันทึกข้อมูลไปยัง b.dart  ประวัติและเก็บข้อมูลที่กรอกไว้ใน ข้อมูลต้นมะเขือเทศ