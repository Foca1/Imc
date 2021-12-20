import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

RadialGauge() {
  return SfRadialGauge(
    axes: [
      RadialAxis(
        minimum: 0,
        maximum: 40,
        showTicks: false,
        axisLineStyle: const AxisLineStyle(
          gradient: SweepGradient(
            colors: [Colors.green, Colors.yellow, Colors.red],
          ),
        ),
      )
    ],
  );
}
