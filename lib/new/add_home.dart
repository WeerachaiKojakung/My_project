import 'package:flutter/material.dart';
import 'db_helper.dart';

class AddHome extends StatefulWidget {
  @override
  State<AddHome> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;



  // get all data
  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

// add data
  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
     setState(() {
    _newTitleController.text = "";
    _dateTimeController.text = "";
  });
    _refreshData();
    
  }

// update data
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
     setState(() {
    _newTitleController.text = "";
    _dateTimeController.text = "";
  });
    _refreshData();
  }

// delete data
  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("data"),
    ));
    _refreshData();
  }
   // Text controllers
  //final TextEditingController _newTimeontroller = TextEditingController();
  final TextEditingController _newTitleController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData = _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
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
              ).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "สายพันธุ์ต้นมะเขือเทศ",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descController,
              maxLength: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ปริมาณที่ปลูก",
              ),
            ),
            SizedBox(height: 10),
            // เพิ่ม TextField สำหรับข้อมูลใหม่ที่นี่
            TextField(
              controller: _newTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "โรงเรือนที่ปลูก",
              ),
            ),
            SizedBox(height: 10),
            // เพิ่ม TextField สำหรับข้อมูลใหม่ที่นี่
            TextField(
              controller: _dateTimeController,
              onTap: () async {
                DateTime? pickedDateTime = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  );
                  if (pickedDateTime!= null) {
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
                    _dateTimeController.text = pickedDateTime.toString();
                  }
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "วันและเวลาปลูก",
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
                  //_dateTimeController.text = "";

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
        title: Text("CRUD Operations"),
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
                      'สายพันธุ์ต้นมะเขือเทศ: ${_allData[index]['title']}',

                      // child: Text(
                      //   _allData[index]['title'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  //subtitle: Text(_allData[index]['desc']),
                  subtitle: Text(_dateTimeController.text.isNotEmpty
                  ? _dateTimeController.text.substring(0, 16): ""), // แสดงค่าจาก _dateTimeController
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
