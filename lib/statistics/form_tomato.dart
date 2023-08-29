import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TormTomatoPage extends StatefulWidget {
  @override
  _TormTomatoPageState createState() => _TormTomatoPageState();
}

class _TormTomatoPageState extends State<TormTomatoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cultivarController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _schoolsController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _cultivarController.dispose();
    _amountController.dispose();
    _schoolsController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: const Text(
          'Smart TreeBox',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dateTimeController,
                onTap: () async {
                  // Show a date picker and update the controller's text with the selected date
                  DateTime? pickedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDateTime != null) {
                    // Show a time picker and update the selected date's time
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
                      );
                      _dateTimeController.text = pickedDateTime.toString();
                    }
                  }
                },
                decoration:
                    InputDecoration(labelText: 'วันและเวลาปลูก'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาเลือกวันที่และเวลา';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cultivarController,
                decoration: InputDecoration(labelText: 'สายพันธุ์ต้นมะเขือเทศ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกพันธุ์';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'ปริมาณที่ปลูก'),
                //keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกจำนวนที่ปลูก';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _schoolsController,
                decoration: InputDecoration(labelText: 'โรงเรือนที่ปลูก'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกตำแหน่งโรงเรือนที่ปลูก';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _daysController,
                decoration: InputDecoration(labelText: 'Days of Planting'),
                //keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter days of planting';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, you can process the data
                    print('Date of Planting: ${_dateController.text}');
                    print('Cultivar: ${_cultivarController.text}');
                    print('Amount Planted: ${_amountController.text}');
                    print('Schools: ${_schoolsController.text}');
                    print('Days of Planting: ${_daysController.text}');
                  }
                },
                child: Text('บันทึกข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
