
// import 'package:flutter/material.dart';
// import 'package:my_app/login/login_page.dart';
// import 'package:get/get.dart';
// import 'package:my_app/login/login_controller.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final controller = Get.put(LoginController());
//   await controller.checkLoginStatus();
//   runApp(const MyApp());
  
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:  LoginPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/login/login_page.dart';
import 'package:get/get.dart';
//import 'package:my_app/login/login_controller.dart';
import 'package:my_app/statistics/data_provider.dart'; // นำเข้าไฟล์ data_provider.dart
import 'package:provider/provider.dart'; // เพิ่มการนำเข้า Provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        // เพิ่ม Provider อื่น ๆ ตามความต้องการ
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}