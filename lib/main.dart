import 'package:calculadora_imc_flutter/app_widget.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppWidget());
}

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(

        ),
      ),
    );
  }
}

