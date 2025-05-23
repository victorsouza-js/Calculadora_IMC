import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String resultado = "";
  double opacity = 0.0;

  void calcularIMC() {
    final double? peso = double.tryParse(pesoController.text);
    final double? alturaCm = double.tryParse(alturaController.text);

    if (peso != null && alturaCm != null && alturaCm > 0) {
      double altura = alturaCm / 100; // converter cm para metros
      double imc = peso / (altura * altura);

      String classificacao = "";

      if (imc < 18.5) {
        classificacao = "Abaixo do peso";
      } else if (imc >= 18.5 && imc < 24.9) {
        classificacao = "Peso normal";
      } else if (imc >= 25 && imc < 29.9) {
        classificacao = "Sobrepeso";
      } else if (imc >= 30 && imc < 34.9) {
        classificacao = "Obesidade Grau I";
      } else if (imc >= 35 && imc < 39.9) {
        classificacao = "Obesidade Grau II";
      } else {
        classificacao = "Obesidade Grau III";
      }

      setState(() {
        resultado = "IMC: ${imc.toStringAsFixed(2)}\n$classificacao";
        opacity = 1.0; 
      });
    } else {
      setState(() {
        resultado = "Por favor, preencha os campos corretamente!";
        opacity = 0.0;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              'Calcule seu IMC',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Peso (kg)",hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold) ),
              
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Altura (cm)",hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold) ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: calcularIMC,
              child: Text("Calcular",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 80,),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 2),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  resultado,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      
      
      

    );
  }
}