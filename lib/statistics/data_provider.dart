import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  String dateTime = '';
  String cultivar = '';
  String amount = '';
  String schools = '';
  String days = '';

  void updateData({
    required String newDateTime, // เพิ่ม required modifier
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
