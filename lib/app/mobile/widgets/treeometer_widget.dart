import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TreeOmeter extends StatefulWidget {
  const TreeOmeter({super.key});

  @override
  State<TreeOmeter> createState() => _TreeOmeterState();
}

class _TreeOmeterState extends State<TreeOmeter> {
  @override
  Widget build(BuildContext context) {
    double startVal = 0;
    double endVal = 5;
    double value = 3;
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: startVal,
          maximum: endVal,
          labelOffset: 30,
          axisLineStyle: AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor,
            thickness: 0.03,
          ),
          majorTickStyle: MajorTickStyle(
            length: 6,
            thickness: 4,
            color: Colors.white,
          ),
          minorTickStyle: MinorTickStyle(
            length: 3,
            thickness: 3,
            color: Colors.white,
          ),
          axisLabelStyle: GaugeTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: startVal,
              endValue: endVal,
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.03,
              endWidth: 0.03,
              gradient: SweepGradient(
                colors: const <Color>[Colors.green, Colors.yellow, Colors.red],
                stops: const <double>[0.0, 0.5, 1],
              ),
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: value,
              needleLength: 0.95,
              enableAnimation: true,
              animationType: AnimationType.ease,
              needleStartWidth: 1.5,
              needleEndWidth: 6,
              needleColor: Colors.green,
              knobStyle: KnobStyle(knobRadius: 0.09),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      't CO2 equivalent',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              angle: 90,
              positionFactor: 1.5,
            ),
          ],
        ),
      ],
    );
  }
}
