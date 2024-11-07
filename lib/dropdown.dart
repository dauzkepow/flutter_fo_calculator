import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // List of items to be displayed in the dropdown
  final List<String> _dropdownItems = ['Apple', 'Banana', 'Orange', 'Grapes'];

  // Variable to store the selected value
  String? _selectedItem;

  // Variable to store the input from the TextField
  TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input-Output Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown Button
            DropdownButton<String>(
              hint: Text('Select Fruit'),
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                  _inputController.text = newValue ?? '';
                });
              },
              items: _dropdownItems.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Input TextField
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Selected Fruit',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Optional: Makes the input field read-only
            ),
          ],
        ),
      ),
    );
  }
}
