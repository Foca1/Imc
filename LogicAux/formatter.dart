class Formater {
  alturaFormat(String altura) {
    var newAltura = [for (int i = 0; i < altura.length; i++) altura[i]];
    if (altura.length == 3) {
      newAltura.insert(1, '.');
    }

    var StringAltura = newAltura
        .toString()
        .replaceAll(',', '')
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '')
        .trim();

    return StringAltura;
  }

  pesoFormat(String peso) {
    var newPeso = [for (int i = 0; i < peso.length; i++) peso[i]];

    switch (peso.length) {
      case 3:
        newPeso.insert(1, '.');
        break;
      case 4:
        newPeso.insert(2, '.');
        break;
      case 5:
        newPeso.insert(3, '.');
        break;
    }

    var StringPeso = newPeso
        .toString()
        .replaceAll(',', '')
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '')
        .trim();

    return StringPeso;
  }
}
