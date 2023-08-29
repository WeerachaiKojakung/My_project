import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:my_app/home.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});
  final controller = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login Page')),
//       body: Center(
//         child: Obx(() {
//           if (controller.googleAccount.value == null)
//             return buildLoginButton(context);
//           else
//             return buildProfileView();
//         }),
//       ),
//     );
//   }

//   Column buildProfileView() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           backgroundImage:
//               Image.network(controller.googleAccount.value?.photoUrl ?? '')
//                   .image,
//           radius: 100,
//         ),
//         Text(
//           controller.googleAccount.value?.displayName ?? '',
//           style: Get.textTheme.headlineSmall,
//         ),
//         Text(
//           controller.googleAccount.value?.email ?? '',
//           style: Get.textTheme.bodyText1,
//         ),
//         SizedBox(height: 16),
//         ActionChip(
//           avatar: Icon(Icons.logout),
//           label: Text('Logout'),
//           onPressed: () {
//             controller.logout();
//           },
//         )
//       ],
//     );
//   }

//   FloatingActionButton buildLoginButton( context) {
//     return FloatingActionButton.extended(
//       onPressed: () {
//         controller.login();
//         Navigator.push(
//           context,
//            MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       },
//       icon: Image.asset(
//         "assets/images/google.png",
//         height: 32,
//         width: 32,
//       ),
//       label: const Text('sign in with Google'),
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login Page')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/Frame1.jpg"),
                fit: BoxFit.cover,
              ),
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //         'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
              //   ),
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(0, 250),
              child: FloatingActionButton.extended(
                onPressed: () {
                  controller.login();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Image.asset(
                  "assets/images/google.png",
                  height: 32,
                  width: 32,
                ),
                label: const Text('Sign in with Google'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
