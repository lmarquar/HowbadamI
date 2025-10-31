import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/widgets/treeOmeter_widget.dart';
import 'package:howbadami/app/mobile/widgets/container_widget.dart';
import 'package:howbadami/core/constants/words.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      Words.energy,
      Words.travel,
      Words.consumption,
      Words.products,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          TreeOmeter(),
          SizedBox(height: 10),
          ...List.generate(4, (index) {
            return ContainerWidget(
              title: list[index],
              description: 'This is descriptive',
            );
          }),
        ],
      ),
    );
  }
}
