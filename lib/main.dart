import 'dart:js';

import 'package:flutter/material.dart';
import 'package:practica_asincronia/services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Asincronia '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Valores en pantalla
  int _ferrariInt = 0;
  int _HyundaiInt = 0;
  int _FisherInt = 0;

  // ancho y duración de Boton 1
  double btnUnowidth = 0.0;
  Duration DurationbtnUno = Duration(seconds: 1);
  Color colorbtnUno = Colors.green;

  // ancho y duración de Boton 2
  double btnDoswidth = 0.0;
  Duration DurationbtnDos = Duration(seconds: 3);
  Color colorbtnDos = Colors.yellow;

  // ancho y duración de Boton 3
  double btnTreswidth = 0.0;
  Duration DurationbtnTres = Duration(seconds: 10);
  Color colorbtnTres = Colors.red;

  //Boton 1
  void _MostrarFerrari() async {
    setState(() {
      DurationbtnUno = Duration(seconds: 1);
      btnUnowidth = 90;
    });
    final result = await MockApi().getFerrariInteger();
    setState(() {
      _ferrariInt = result;
      DurationbtnUno = Duration(seconds: 0);
      btnUnowidth = 0.0;
    });
  }

  //Boton 2
  void _MostrarHyundai() async {
    setState(() {
      DurationbtnDos = Duration(seconds: 3);
      btnDoswidth = 90;
    });
    final result = await MockApi().getHyundaiInteger();
    setState(() {
      _HyundaiInt = result;
      DurationbtnDos = Duration(seconds: 0);
      btnDoswidth = 0;
    });
  }

  //Boton 3
  void _MostrarFisher() async {
    setState(() {
      DurationbtnTres = Duration(seconds: 10);
      btnTreswidth = 90;
    });
    final result = await MockApi().getFisherPriceInteger();
    setState(() {
      _FisherInt = result;
      DurationbtnTres = Duration(seconds: 0);
      btnTreswidth = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Asincronia',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //boton 1
            FloatingActionButton(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.flash_on,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: _MostrarFerrari),
            Padding(padding: EdgeInsets.all(5.0)),
            AnimatedContainer(
              duration: DurationbtnUno,
              curve: Curves.easeInSine,
              width: btnUnowidth,
              height: 10,
              decoration: BoxDecoration(color: colorbtnUno),
            ),
            Text('$_ferrariInt',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),

            //boton 2
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.car_rental,
                size: 20,
                color: Colors.black,
              ),
              onPressed: _MostrarHyundai,
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            AnimatedContainer(
              duration: DurationbtnDos,
              curve: Curves.easeInSine,
              width: btnDoswidth,
              height: 10,
              decoration: BoxDecoration(color: colorbtnDos),
            ),
            Text('$_HyundaiInt',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow)),

            //boton 3
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: _MostrarFisher),
            Padding(padding: EdgeInsets.all(5.0)),
            AnimatedContainer(
              duration: DurationbtnTres,
              curve: Curves.easeInSine,
              width: btnTreswidth,
              height: 10,
              decoration: BoxDecoration(color: colorbtnTres),
            ),
            Text('$_FisherInt',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
