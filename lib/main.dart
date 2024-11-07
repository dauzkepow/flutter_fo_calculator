/*
 Kalkulator Budaya Komputer - clear
 https://www.youtube.com/watch?v=9eJ2etuAYc8

 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel input
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();
  TextEditingController hasil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Kalkulator Sederhana',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: angka1,
                decoration: InputDecoration(
                    hintText: "Masukkan angka pertama",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: angka2,
                decoration: InputDecoration(
                    hintText: "Masukkan angka kedua",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: hasil,
                decoration: InputDecoration(
                    hintText: "Hasil",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const Text(
                "Hasil nya : ",
                style: TextStyle(fontSize: 20.0),
              ),
              //Text("Hasil nya ${hasile}", style: TextStyle(fontSize: 20.0),)

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Tambah
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        perhitungan("+");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        perhitungan("-");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Kurang',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        perhitungan("*");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Kali',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        perhitungan("/");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Bagi',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    //perhitungan("/");
                    hasil.clear();
                    angka1.clear();
                    angka2.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//perhitungan
  void perhitungan(String tanda) {
    double ang1 = double.parse(angka1.text);
    double ang2 = double.parse(angka2.text);
    double hasile = 0;

    if (tanda == "+") {
      hasile = ang1 + ang2;
    } else if (tanda == "-") {
      hasile = ang1 - ang2;
    } else if (tanda == "*") {
      hasile = ang1 * ang2;
    } else if (tanda == "/") {
      hasile = ang1 / ang2;
    }
    hasil.text = hasile.toString();
  }
}
