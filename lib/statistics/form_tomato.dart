import 'package:flutter/material.dart';

class TormTomatoPage extends StatefulWidget {
  @override
  _TormTomatoPageState createState() => _TormTomatoPageState();
}

class _TormTomatoPageState extends State<TormTomatoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cultivarController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _schoolsController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  @override
  void dispose() {
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
        title: Text('Add Statistics'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _cultivarController,
                decoration: InputDecoration(labelText: 'Early Tomato Cultivar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a cultivar';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount Planted'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount planted';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _schoolsController,
                decoration: InputDecoration(labelText: 'Schools'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter schools';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _daysController,
                decoration: InputDecoration(labelText: 'Days of Planting'),
                keyboardType: TextInputType.number,
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
                    print('Cultivar: ${_cultivarController.text}');
                    print('Amount Planted: ${_amountController.text}');
                    print('Schools: ${_schoolsController.text}');
                    print('Days of Planting: ${_daysController.text}');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
