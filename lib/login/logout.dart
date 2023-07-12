import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/login/login_controller.dart';

class LogoutPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.logout();
                Get.offAllNamed('/login'); // Navigate back to the login page
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
