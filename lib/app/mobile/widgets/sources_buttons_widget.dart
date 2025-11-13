import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/energy_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/food_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/other_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/travel_page.dart';
import 'package:howbadami/app/mobile/scaffolds/app_padding_scaffold.dart';
import 'package:howbadami/core/firebase/database_service.dart';
import 'package:howbadami/core/functions/utils.dart';

class SourcesButtons extends StatefulWidget {
  const SourcesButtons({super.key});

  @override
  State<SourcesButtons> createState() => _SourcesButtonsState();
}

class _SourcesButtonsState extends State<SourcesButtons> {
  Map<String, String> values = {
    'TravelE': 'Loading...',
    'FoodE': 'Loading...',
    'EnergyE': 'Loading...',
    'GoodsE': 'Loading...',
  };

  @override
  void initState() {
    super.initState();
    _loadAllValues();
  }

  Future<void> _loadAllValues() async {
    for (String path in values.keys) {
      try {
        final snapshot = await DatabaseService().read(path: path);
        if (mounted) {
          setState(() {
            values[path] = snapshot?.value?.toString() ?? '0';
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            values[path] = 'Error';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2, // two columns
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildGridButton(
              context,
              values['TravelE']!,
              'assets/images/travel.jpg',
              'hero1',
              TravelPage(),
            ),
            _buildGridButton(
              context,
              values['FoodE']!,
              'assets/images/food.png',
              'hero2',
              FoodPage(),
            ),
            _buildGridButton(
              context,
              values['EnergyE']!,
              'assets/images/energy.jpg',
              'hero3',
              EnergyPage(),
            ),
            _buildGridButton(
              context,
              values['GoodsE']!,
              'assets/images/goods.jpg',
              'hero4',
              OtherPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton(
    BuildContext context,
    String label,
    String imagePath,
    String heroTag,
    Widget destination,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,

                width: 80,
                height: 80,
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
