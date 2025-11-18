import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/energy_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/food_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/other_page.dart';
import 'package:howbadami/app/mobile/pages/main/emissions/travel_page.dart';
import 'package:howbadami/core/firebase/database_service.dart';

class SourcesButtons extends StatefulWidget {
  const SourcesButtons({super.key});

  @override
  State<SourcesButtons> createState() => _SourcesButtonsState();
}

class _SourcesButtonsState extends State<SourcesButtons> {
  late Future<Map<String, dynamic>> emissionValues;

  @override
  void initState() {
    super.initState();
    emissionValues = DatabaseService().get(pattern: "E");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<Map<String, dynamic>>(
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

            return GridView.count(
              crossAxisCount: 2, // two columns
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildGridButton(
                  context,
                  data['TravelE']?.toString() ?? '0',
                  'assets/images/travel.jpg',
                  'hero1',
                  TravelPage(),
                ),
                _buildGridButton(
                  context,
                  data['FoodE']?.toString() ?? '0',
                  'assets/images/food.png',
                  'hero2',
                  FoodPage(),
                ),
                _buildGridButton(
                  context,
                  data['EnergyE']?.toString() ?? '0',
                  'assets/images/energy.jpg',
                  'hero3',
                  EnergyPage(),
                ),
                _buildGridButton(
                  context,
                  data['GoodsE']?.toString() ?? '0',
                  'assets/images/goods.jpg',
                  'hero4',
                  OtherPage(),
                ),
              ],
            );
          },
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
