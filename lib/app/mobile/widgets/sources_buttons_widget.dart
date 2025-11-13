import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/energy_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/food_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/other_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/travel_page.dart';
import 'package:howbadami/app/mobile/scaffolds/app_padding_scaffold.dart';
import 'package:howbadami/core/functions/utils.dart';

class SourcesButtons extends StatefulWidget {
  const SourcesButtons({super.key});

  @override
  State<SourcesButtons> createState() => _SourcesButtonsState();
}

class _SourcesButtonsState extends State<SourcesButtons> {
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
              'Travel',
              'assets/images/travel.jpg',
              'hero1',
              TravelPage(),
            ),
            _buildGridButton(
              context,
              'Food',
              'assets/images/food.jpg',
              'hero2',
              FoodPage(),
            ),
            _buildGridButton(
              context,
              'Nature',
              'assets/images/nature.jpg',
              'hero3',
              EnergyPage(),
            ),
            _buildGridButton(
              context,
              'Tech',
              'assets/images/tech.jpg',
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
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
