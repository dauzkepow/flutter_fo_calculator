import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Controller for text input fields
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();

  // Dropdown list of operations
  List<String> _operations = ['Add', 'Subtract', 'Multiply', 'Divide'];

  // Selected operation (default is 'Add')
  String _selectedOperation = 'Add';

  // Result of the calculation
  String _result = '0';

  // Perform the selected operation
  void _calculate() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (_selectedOperation) {
        case 'Add':
          _result = (num1 + num2).toString();
          break;
        case 'Subtract':
          _result = (num1 - num2).toString();
          break;
        case 'Multiply':
          _result = (num1 * num2).toString();
          break;
        case 'Divide':
          if (num2 != 0) {
            _result = (num1 / num2).toString();
          } else {
            _result = 'Error: Division by Zero';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input fields for numbers
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Dropdown for selecting operation
            DropdownButton<String>(
              value: _selectedOperation,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
              items: _operations.map((String operation) {
                return DropdownMenuItem<String>(
                  value: operation,
                  child: Text(operation),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Button to trigger calculation
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),

            // Result display
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
