import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  List<String> dataList = []; // เพิ่ม List สำหรับเก็บข้อมูล

  // ฟังก์ชันเพิ่มข้อมูลลงใน dataList
  void addData(String newData) {
    dataList.add(newData);
    notifyListeners();
  }

  String dateTime = '';
  String cultivar = '';
  String amount = '';
  String schools = '';
  String days = '';

  // ฟังก์ชันอัปเดตข้อมูลที่รับมา
  void updateData({
    required String newDateTime,
    String newCultivar = '',
    String newAmount = '',
    String newSchools = '',
    String newDays = '',
  }) {
    dateTime = newDateTime;
    cultivar = newCultivar;
    amount = newAmount;
    schools = newSchools;
    days = newDays;

    // แจ้งเตือน Provider ว่าข้อมูลได้รับการอัปเดต
    notifyListeners();
  }
}
