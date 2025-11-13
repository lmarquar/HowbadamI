import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel')),
      body: Padding(padding: const EdgeInsets.all(20.0), child: Text('random')),
    );
  }
}
