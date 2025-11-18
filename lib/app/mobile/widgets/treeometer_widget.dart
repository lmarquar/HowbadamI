import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:howbadami/core/firebase/database_service.dart';

class TreeOmeter extends StatefulWidget {
  const TreeOmeter({super.key});

  @override
  State<TreeOmeter> createState() => _TreeOmeterState();
}

class _TreeOmeterState extends State<TreeOmeter> {
  late Future<Map<String, dynamic>> emissionValues;

  @override
  void initState() {
    super.initState();
    emissionValues = DatabaseService().get(pattern: "E");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: emissionValues,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final data = snapshot.data!;

        // Sum all values
        double value = 0;
        data.forEach((key, val) {
          if (val is num) {
            value += val.toDouble();
          } else if (val is String) {
            value += double.tryParse(val) ?? 0;
          }
        });

        double startVal = 0;
        double endVal = 5;

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
                  startWidth: 0.01,
                  endWidth: 0.03,
                  gradient: SweepGradient(
                    colors: const <Color>[
                      Colors.green,
                      Colors.yellow,
                      Colors.red,
                    ],
                    stops: const <double>[0.0, 0.01, 0.5],
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
                  needleColor: Colors.brown,
                  knobStyle: KnobStyle(knobRadius: 0.09),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Column(
                    children: <Widget>[
                      Text(
                        value.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        't CO2 equivalent',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  angle: 90,
                  positionFactor: 1.5,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
