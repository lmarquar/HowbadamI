import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/widgets/sources_buttons_widget.dart';
import 'package:howbadami/app/mobile/widgets/treeometer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          TreeOmeter(),
          SizedBox(height: 10),
          SourcesButtons(),
        ],
      ),
    );
  }
}
