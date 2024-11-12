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
  double num1 = 0;
  double out_srkecil = 0;
  String out_srkecils = '0';
  double out_srbesar = 0;
  String out_srbesars = '0';
  double out_odcodp = 0;
  String out_odcodps = '0';

  double _12 = 0;
  double _14 = 0;
  double _18 = 0;
  double _116 = 0;

  String _12s = '0';
  String _14s = '0';
  String _18s = '0';
  String _116s = '0';

  String sr1 = '';
  String sr2 = '';

  void perhitunganodcodp() {
    sr1 = '';
    sr2 = '';
    out_srkecils = '';
    out_srbesars = '';

    _12 = out_odcodp - 3.70;
    _14 = out_odcodp - 7.25;
    _18 = out_odcodp - 10.38;
    _116 = out_odcodp - 14.10;

    //rubah ke string
    out_odcodps = (out_odcodp).toStringAsFixed(2);
    _12s = (_12).toStringAsFixed(2);
    _14s = (_14).toStringAsFixed(2);
    _18s = (_18).toStringAsFixed(2);
    _116s = (_116).toStringAsFixed(2);
  }

  void perhitungansr() {
    out_odcodps = '';
    _12 = out_srkecil - 3.70;
    _14 = out_srkecil - 7.25;
    _18 = out_srkecil - 10.38;
    _116 = out_srkecil - 14.10;

    //rubah ke string
    out_srkecils = (out_srkecil).toStringAsFixed(2);
    out_srbesars = (out_srbesar).toStringAsFixed(2);
    _12s = (_12).toStringAsFixed(2);
    _14s = (_14).toStringAsFixed(2);
    _18s = (_18).toStringAsFixed(2);
    _116s = (_116).toStringAsFixed(2);
  }

  // Perform the selected operation
  void _calculate() {
    num1 = double.tryParse(_num1Controller.text) ?? 0;

    setState(() {
      switch (_selectedOperation) {
        case 'ODC 1:4':
          //_result = (num1 - 7.25).toStringAsFixed(2); //double to string
          //double _12 = double.parse(out_odcodp); //string to double
          out_odcodp = num1 - 7.25;
          perhitunganodcodp();
          break;
        case 'ODC 1:8':
          out_odcodp = num1 - 10.38;
          perhitunganodcodp();
          break;

        case 'SR 1%':
          sr1 = '1%';
          sr2 = '99%';
          out_srkecil = num1 - 22.5;
          out_srbesar = num1 - 0.25;
          perhitungansr();
          break;

        case 'SR 2%':
          sr1 = '2%';
          sr2 = '98%';
          out_srkecil = (num1 - 18.7);
          out_srbesar = (num1 - 0.32);
          perhitungansr();
          break;

        case 'SR 3%':
          sr1 = '3%';
          sr2 = '97%';
          out_srkecil = (num1 - 17.1);
          out_srbesar = (num1 - 0.35);
          perhitungansr();
          break;
        case 'SR 5%':
          sr1 = '5%';
          sr2 = '95%';
          out_srkecil = (num1 - 14.6);
          out_srbesar = (num1 - 0.42);
          perhitungansr();
          break;
        case 'SR 10%':
          sr1 = '10%';
          sr2 = '90%';
          out_srkecil = (num1 - 10.3);
          out_srbesar = (num1 - 0.65);
          perhitungansr();
          break;
        case 'SR 15%':
          sr1 = '15%';
          sr2 = '85%';
          out_srkecil = (num1 - 8.56);
          out_srbesar = (num1 - 0.9);
          perhitungansr();
          break;
        case 'SR 20%':
          sr1 = '20%';
          sr2 = '80%';
          out_srkecil = (num1 - 7.26);
          out_srbesar = (num1 - 1.17);
          perhitungansr();
          break;
        case 'SR 25%':
          sr1 = '25%';
          sr2 = '75%';
          out_srkecil = (num1 - 6.28);
          out_srbesar = (num1 - 1.45);
          perhitungansr();
          break;
        case 'SR 30%':
          sr1 = '30%';
          sr2 = '70%';
          out_srkecil = (num1 - 5.47);
          out_srbesar = (num1 - 1.75);
          perhitungansr();
          break;
        case 'SR 35%':
          sr1 = '35%';
          sr2 = '65%';
          out_srkecil = (num1 - 4.79);
          out_srbesar = (num1 - 2.07);
          perhitungansr();
          break;
        case 'SR 50%_1:2':
          sr1 = '50%';
          sr2 = '50%';
          out_srkecil = (num1 - 3.7);
          out_srbesar = (num1 - 3.7);
          perhitungansr();
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
                    setState(() {
                      out_odcodps = '';
                      sr1 = '';
                      sr2 = '';
                      out_srkecils = '';
                      out_srbesars = '';
                      _12s = '';
                      _14s = '';
                      _18s = '';
                      _116s = '';
                    });
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
                  '$sr1 = $out_srkecils',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$out_odcodps',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$sr2 = $out_srbesars',
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$_12s',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_14s',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_18s',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_116s',
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
