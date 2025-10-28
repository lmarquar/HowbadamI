import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(color: Colors.teal, height: 20)),
              Flexible(
                child: Container(
                  color: Colors.amber,
                  height: 20,
                  child: Text('Flexible Widget'),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  color: Colors.amber,
                  height: 20,
                  child: Text('Flexible Widget'),
                ),
              ),
              Expanded(child: Container(color: Colors.teal, height: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
