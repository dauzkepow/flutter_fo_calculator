import 'package:flutter/material.dart';
/*
1:2	=	-3.70		
1:4	=	-7.25
1:8	= -10.38
1:16 = -14.10		
1:32 = -17.45


*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  //=== Operasional LOGIC ===

  // Controller for text input fields
  final TextEditingController _num1Controller = TextEditingController();
  //TextEditingController _num2Controller = TextEditingController();

  // Dropdown list of operations
  final List<String> _operations = [
    'Pilihan redaman',
    'ODC 1:4',
    'ODC 1:8',
    'SR 1%',
    'SR 2%',
    'SR 3%',
    'SR 5%',
    'SR 10%',
    'SR 15%',
    'SR 20%',
    'SR 25%',
    'SR 30%',
    'SR 35%',
    'SR 50%_1:2',
  ];

  // Selected operation (default is 'Add')
  String _selectedOperation = 'Pilihan redaman';

  // Result of the calculation
  double a = 0;
  String _result = '0';
  String _result1 = '0';
  String sr1 = '';
  String sr2 = '';
  String _12 = '0';
  String _14 = '0';
  String _18 = '0';
  String _116 = '0';

  // Perform the selected operation
  void _calculate() {
    //double _12 = double.tryParse(_result.text) ?? 0;
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    //double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (_selectedOperation) {
        case 'ODC 1:4':
          _result = (num1 - 7.25).toStringAsFixed(2);
          break;
        case 'ODC 1:8':
          _result = (num1 - 10.38).toStringAsFixed(2);
          break;
        case 'SR 1%':
          sr1 = '1%';
          sr2 = '99%';
          //_result = (num1 - 22.5).toStringAsFixed(2);
          a = num1 - 22.5;
          _result1 = (num1 - 0.25).toStringAsFixed(2);
          _12 = (a - 4).toStringAsFixed(2);
          break;
        case 'SR 2%':
          sr1 = '2%';
          sr2 = '98%';
          _result = (num1 - 18.7).toStringAsFixed(2);
          _result1 = (num1 - 0.32).toStringAsFixed(2);
          break;
        case 'SR 3%':
          sr1 = '3%';
          sr2 = '97%';
          _result = (num1 - 17.1).toStringAsFixed(2);
          _result1 = (num1 - 0.35).toStringAsFixed(2);
          break;
        case 'SR 5%':
          sr1 = '5%';
          sr2 = '95%';
          _result = (num1 - 14.6).toStringAsFixed(2);
          _result1 = (num1 - 0.42).toStringAsFixed(2);
          break;
        case 'SR 10%':
          sr1 = '10%';
          sr2 = '90%';
          _result = (num1 - 10.3).toStringAsFixed(2);
          _result1 = (num1 - 0.65).toStringAsFixed(2);
          break;
        case 'SR 15%':
          sr1 = '15%';
          sr2 = '85%';
          _result = (num1 - 8.56).toStringAsFixed(2);
          _result1 = (num1 - 0.9).toStringAsFixed(2);
          break;
        case 'SR 20%':
          sr1 = '20%';
          sr2 = '80%';
          _result = (num1 - 7.26).toStringAsFixed(2);
          _result1 = (num1 - 1.17).toStringAsFixed(2);
          break;
        case 'SR 25%':
          sr1 = '25%';
          sr2 = '75%';
          _result = (num1 - 6.28).toStringAsFixed(2);
          _result1 = (num1 - 1.45).toStringAsFixed(2);
          break;
        case 'SR 30%':
          sr1 = '30%';
          sr2 = '70%';
          _result = (num1 - 5.47).toStringAsFixed(2);
          _result1 = (num1 - 1.75).toStringAsFixed(2);
          break;
        case 'SR 35%':
          sr1 = '35%';
          sr2 = '65%';
          _result = (num1 - 4.79).toStringAsFixed(2);
          _result1 = (num1 - 2.07).toStringAsFixed(2);
          break;
        case 'SR 50%_1:2':
          sr1 = '50%';
          sr2 = '50%';
          _result = (num1 - 3.7).toStringAsFixed(2);
          _result1 = (num1 - 3.7).toStringAsFixed(2);
          break;
      }
    });
  }

  //=== Tampilan UI ===
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FO Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            // Input fields for numbers
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan nilai redaman',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

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
            const SizedBox(height: 16),

            // Button to trigger calculation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Hitung'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _num1Controller.clear();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Result display
            const Text(
              '== Output ==',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$sr1 = $_result',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$sr2 = $_result1',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 35),

            const Text(
              '== Output Splitter ==',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1 : 2',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1 : 4',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1 : 8',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1 : 16',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 17),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_12',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_14',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_18',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_116',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Text(
        '|= Copyright c 2024 - IP1 Solo Dev Team =|',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
