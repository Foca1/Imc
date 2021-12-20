class ImcSolver {
  double imc(kg, cm) {
    if (kg == 0 || cm == 0) return 0.0;
    return (kg / (cm * cm));
  }
}
