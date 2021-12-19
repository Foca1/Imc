import 'package:flutter/material.dart';
import 'LogicAux/imc_solve.dart';
import 'LogicAux/decorated_labels.dart';

class AppImc extends StatefulWidget {
  @override
  _AppImcState createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  var cmController = TextEditingController();
  var kgController = TextEditingController();
  var imc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            //Titulo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Calculo IMC',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            //TextFormField Peso
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: decoratedLabel('kg', kgController),
            ),
            //TextFormField Altura
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: decoratedLabel('cm', cmController),
            ),
            //Button Resultado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: ElevatedButton(
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 40),
                ),
                onPressed: () {
                  var cm = double.parse(cmController.text == ''
                      ? cmController.text = '0.0'
                      : cmController.text);

                  var kg = double.parse(kgController.text == ''
                      ? kgController.text = '0.0'
                      : kgController.text);

                  setState(() => imc = double.parse(
                      ImcSolver().imc(kg, cm).toStringAsPrecision(4)));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 130,
              ),
              child: Text(
                'Seu imc é \n    ${imc == null ? '' : imc.toString()}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
