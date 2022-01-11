import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

setGauge({color, labelname, start, end}) {
  return GaugeRange(
    startValue: start,
    endValue: end,
    color: color,
    startWidth: 60,
    endWidth: 60,
    label: labelname,
    labelStyle: const GaugeTextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      fontFamily: 'Times',
    ),
  );
}

RadialGauge({double valueImc = 0}) {
  return SfRadialGauge(
    axes: [
      RadialAxis(
        minimum: 13.5,
        maximum: 35.0,
        startAngle: 180,
        endAngle: 0,
        showTicks: false,
        showAxisLine: false,
        showLabels: false,
        annotations: [
          GaugeAnnotation(
            widget: Text(
              valueImc.toString(),
              style: TextStyle(
                fontFamily: 'Times',
                color: Colors.purple[400],
                fontSize: 32,
              ),
            ),
            axisValue: 110,
            positionFactor: 0.1,
          )
        ],
        ranges: [
          setGauge(
            color: Colors.grey,
            labelname: 'Magreza',
            start: 13.5,
            end: 18.5,
          ),
          setGauge(
            color: Colors.green,
            labelname: 'Normal',
            start: 18.5,
            end: 24.9,
          ),
          setGauge(
            color: Colors.green[700],
            labelname: 'Sobrepeso',
            start: 24.9,
            end: 29.9,
          ),
          setGauge(
            color: Colors.red,
            labelname: 'Obeso',
            start: 29.9,
            end: 35.0,
          ),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: valueImc,
            markerHeight: 40,
            markerWidth: 20,
            elevation: 4,
            color: Colors.purple[400],
          ),
        ],
      )
    ],
  );
}
