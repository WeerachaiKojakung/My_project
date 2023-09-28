import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/login/login_controller.dart';
import 'package:my_app/login/login_page.dart';
import 'package:my_app/login/medicine.dart';


class NavBar extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              controller.googleAccount.value?.displayName ?? '',
              style: TextStyle(
              color: Colors.white, 
                fontSize: 22, 
                ),
              ),
            accountEmail: Text(
              controller.googleAccount.value?.email ?? '',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 16,
                ),
              ),
              
            currentAccountPicture: CircleAvatar(
                backgroundImage: Image.network(
                      controller.googleAccount.value?.photoUrl ?? '')
                  .image
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share'),
          //   onTap: () => null,
          // ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            //onTap: () => null,
            
            onTap: () {
                Get.to(() => MyWidget()); // แทน Medicine() ด้วยหน้าที่คุณต้องการเปิด
              },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => null,
          // ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              controller.logout();
              Get.offAll(LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
