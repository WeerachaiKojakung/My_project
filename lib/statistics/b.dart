// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'data_provider.dart';

// class b extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ดึงข้อมูลจาก Provider
//     final dataProvider = Provider.of<DataProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.grey,
//         ),
//         title: const Text(
//           'Smart TreeBox',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Date of Planting: ${dataProvider.dateTime}'),
//             Text('Cultivar: ${dataProvider.cultivar}'),
//             Text('Amount Planted: ${dataProvider.amount}'),
//             Text('Schools: ${dataProvider.schools}'),
//             Text('Days of Planting: ${dataProvider.days}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'data_provider.dart';

class b extends StatefulWidget {
  @override
  _bState createState() => _bState();
}

class _bState extends State<b> {
  List<String> dataList = [];

  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลที่ส่งมาจากหน้า form_tomato.dart
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      // เพิ่มข้อมูลลงในรายการ dataList
      dataList.add('DateTime: ${arguments['newDateTime']}');
      dataList.add('Cultivar: ${arguments['newCultivar']}');
      dataList.add('Amount: ${arguments['newAmount']}');
      dataList.add('Schools: ${arguments['newSchools']}');
      dataList.add('Days: ${arguments['newDays']}');
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลที่บันทึกไว้'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < dataList.length; i++)
              Text('Data #$i: ${dataList[i]}'), // แสดงข้อมูลแต่ละรายการ
          ],
        ),
      ),
    );
  }
}




// // ต้องการให้ กดบันทึกข้อมูลจาก form_tomato.dart 
// // บันทึกข้อมูลไปยัง b.dart  ประวัติและเก็บข้อมูลที่กรอกไว้ใน ข้อมูลต้นมะเขือเทศ