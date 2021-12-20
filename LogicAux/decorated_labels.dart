import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

decoratedLabel(String pedido, TextEditingController controller) {
  var maskedCm =
      MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});

  var maskedKg = MaskTextInputFormatter(filter: {"#": RegExp(r'[0-9]')});

  String caracteristica = '';
  int tamanhoMaximo = 1;
  MaskTextInputFormatter inputForm;

  if (pedido == 'cm') {
    tamanhoMaximo = 4;
    caracteristica = 'Altura';
    inputForm = maskedCm;
  } else {
    tamanhoMaximo = 6;
    caracteristica = 'Peso';
    inputForm = maskedKg;
  }

  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [inputForm],
    maxLength: tamanhoMaximo,
    decoration: InputDecoration(
      counterText: '',
      labelText: caracteristica,
      labelStyle: const TextStyle(
        fontSize: 22,
      ),
      floatingLabelStyle: const TextStyle(fontSize: 28),
    ),
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    onChanged: (value) {
      if (pedido != 'cm') {
        controller.text.length < 5
            ? maskedKg.updateMask(mask: '##.##')
            : maskedKg.updateMask(mask: '###.##');
      }
    },
  );
}
