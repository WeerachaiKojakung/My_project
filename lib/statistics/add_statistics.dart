// import 'package:flutter/material.dart';
// import 'package:my_app/statistics/form_tomato.dart';
 import 'package:my_app/statistics/form_medicine.dart';
 import 'package:my_app/new/add_home.dart';
//import 'package:my_app/statistics/b.dart';

// class AddStatisticsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('เพิ่มข้อมูลต้นมะเขือเทศและการให้ยา', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading:IconButton(
//           icon: Icon(Icons.arrow_back_ios_new),
//           color: Colors.black,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         )
//       ),
//       body:  ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.add_box_outlined),
//             title: Text('เพิ่มข้อมูลต้นมะเขือเทศ'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => TormTomatoPage()), // Replace with your actual constructor
//               );
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.add_box_outlined),
//             title: Text('เพิ่มข้อมูลการให้ยา'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DatePickerExample()),
//               );
//             },
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.add_box_outlined),
//             title: Text('เพิ่มข้อมูลการให้ปุ๋ย'),
//             onTap: () => null,
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AddStatisticsPage extends StatefulWidget {
  const AddStatisticsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddStatisticsPageState createState() => _AddStatisticsPageState();
}

class _AddStatisticsPageState extends State<AddStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('เพิ่มข้อมูลต้นมะเขือเทศและการให้ยา',style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey, // Use Colors.grey here
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: IconTheme(
                  data: IconThemeData(color: Colors.grey),
                  child: Column(
                    children: [
                      Icon(Icons.add_to_photos_outlined),
                      Text("เพิ่มข้อมูล", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Tab(
                child: IconTheme(
                  data: IconThemeData(color: Colors.grey),
                  child: Column(
                    children: [
                      Icon(Icons.content_paste),
                      Text("ประวัติ", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              // Tab(
              //   child: IconTheme(
              //     data: IconThemeData(color: Colors.grey),
              //     child: Column(
              //       children: [
              //         Icon(Icons.account_box_outlined),
              //         Text("เกี่ยวกับ", style: TextStyle(color: Colors.black)),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PageToday(),
            PageHistory(),
            // ScreenPage3(),
          ],
        ),
      ),
    );
  }
}

class PageToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                //MaterialPageRoute(builder: (context) => TormTomatoPage()), // Replace with your actual constructor
              MaterialPageRoute(builder: (context) => AddHome()),

              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text('เพิ่มข้อมูลการให้ยา'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DatePickerExample()),
              );
            },
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

class PageHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.content_paste_go ),
            title: Text('ข้อมูลต้นมะเขือเทศ'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddHome()), // Replace with your actual constructor
                //MaterialPageRoute(builder: (context) => b()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.content_paste_go ),
            title: Text('ข้อมูลการให้ยา'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DatePickerExample()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.content_paste_go ),
            title: Text('ข้อมูลการให้ปุ๋ย'),
            onTap: () => null,
          ),
          Divider(),
        ],
      ),
    );
  }
}

class ScreenPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("About Page"),
    );
  }
}

