//ในไฟล์ add_medicine.dart
import 'package:flutter/material.dart';
import 'db_helper.dart';

class AddMedicine extends StatefulWidget {
  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  String? selectedDiseaseGroup;
  List<String> diseaseGroups = ["กลุ่มที่ 1", "กลุ่มที่ 2"];
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  // get all data
  void _refreshData() async {
    final data = await SQLHelper.getAllData(tableName: 'medicine');
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = "";
    _descController.text = "";
    _aaController.text = ""; // เพิ่ม _aaController.text
    _bbController.text = ""; // เพิ่ม _bbController.text

    _refreshData();
  }

  // อัปเดตเมทอด _addData เพื่อรับค่า "aa" และ "bb" จากคอนโทรลเลอร์
  Future<void> _addData() async {
    await SQLHelper.createData(
      _titleController.text,
      _descController.text,
      _aaController.text, // เพิ่ม _aaController.text
      _bbController.text, // เพิ่ม _bbController.text
      tableName: 'medicine',
    );
    _refreshData();
  }

  // อัปเดตเมทอด _updateData เพื่อรับค่า "aa" และ "bb" จากคอนโทรลเลอร์
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(
      id,
      _titleController.text,
      _descController.text,
      _aaController.text, // เพิ่ม _aaController.text
      _bbController.text, // เพิ่ม _bbController.text
      tableName: 'medicine',
    );
    _refreshData();
  }

// delete data
  void _deleteData(int id) async {
    await SQLHelper.deleteData(id, tableName: 'medicine');

    final snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        "ลบข้อมูลเสร็จสิ้น",
        style: TextStyle(
          fontSize: 16, // ปรับขนาดตัวอักษรที่นี่
          fontWeight: FontWeight.bold, // ปรับลักษณะตัวอักษรอื่น ๆ ที่นี่
          color: Colors.white, // ปรับสีตัวอักษรที่นี่
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    _refreshData();
  }

  // Text controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _aaController = TextEditingController(); // เพิ่ม _aaController
  final TextEditingController _bbController = TextEditingController(); // เพิ่ม _bbController

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
      _aaController.text = existingData['aa']; // เพิ่ม _aaController.text
      _bbController.text = existingData['bb']; // เพิ่ม _bbController.text
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(
                context,
              ).viewInsets.bottom +
              50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ชื่อยา",
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedDiseaseGroup,
              items: diseaseGroups.map((group) {
                return DropdownMenuItem<String>(
                  value: group,
                  child: Text(group),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDiseaseGroup = newValue;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "กลุ่มโรค",
              ),
            ),

            // TextField(
            //   controller: _aaController,
            //   maxLength: 4,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "กลุ่มโรค",
            //   ),
            // ),
            SizedBox(height: 10),
            // เพิ่ม TextField สำหรับข้อมูลใหม่ที่นี่
            TextField(
              controller: _bbController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "โรงเรือนที่ปลูก",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _titleController,
              onTap: () async {
                DateTime? pickedDateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDateTime != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    pickedDateTime = DateTime(
                      pickedDateTime.year,
                      pickedDateTime.month,
                      pickedDateTime.day,
                      pickedTime.hour,
                      pickedTime.minute,
                      0,
                    );
                    _titleController.text = pickedDateTime.toString();
                  }
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "วันและเวลาให้ยา",
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  }
                  if (id != null) {
                    await _updateData(id);
                  }

                  _titleController.text = "";
                  _descController.text = "";
                  _aaController.text = "";
                  _bbController.text = "";
                  //_dateController.text = "";

                  Navigator.of(context).pop();
                  print("Data Added: ");
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "update",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeceaf4),
      appBar: AppBar(
        title: Text("ข้อมูลการให้ยา"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'ชื่อยา: ${_allData[index]['desc']}',

                      // child: Text(
                      //   _allData[index]['title'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  subtitle: Text(_allData[index]['title']),
                  // subtitle: Text(_dateTimeController.text.isNotEmpty
                  // ? _dateTimeController.text.substring(0, 16): ""), // แสดงค่าจาก _dateTimeController
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showBottomSheet(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.indigo,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteData(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }
}
