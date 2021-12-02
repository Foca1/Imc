import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LogicAux/imc_solve.dart';
import 'LogicAux/formatter.dart';

class AppImc extends StatefulWidget {
  @override
  _AppImcState createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  final formatter = Formater();
  final cmController = TextEditingController();
  final kgController = TextEditingController();

  decoratedLabel(String pedido, TextEditingController controller) {
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    String caracteristica = '';
    int tamanhoMaximo = 1;

    if (pedido == 'cm') {
      tamanhoMaximo = 3;
      caracteristica = 'Altura';
    } else {
      tamanhoMaximo = 5;
      caracteristica = 'Peso';
    }

    return TextFormField(
      onChanged: (text) {
        try {
          setState(() {
            controller.text = formatter.pesoFormat(text);
          });
          print(formatter.alturaFormat(text));
        } on FormatException catch (_) {}
      },
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[.,0-9]'))],
      maxLength: tamanhoMaximo,
      decoration: InputDecoration(
        counterText: '',
        labelText: caracteristica,
        labelStyle: const TextStyle(
          fontSize: 22,
        ),
        floatingLabelStyle: const TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            //Resultado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: ElevatedButton(
                child: Text('Calcular'),
                onPressed: () {
                  final cm =
                      double.parse(cmController.text.replaceAll(',', '.'));
                  final kg =
                      double.parse(kgController.text.replaceAll(',', '.'));

                  final imc = double.parse(
                      imcSolver().imc(kg, cm).toStringAsPrecision(4));

                  print(imc);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
