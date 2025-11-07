import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/widgets/container_widget.dart';
import 'package:howbadami/app/mobile/widgets/hero_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Carbon offset",
      "News outlets",
      "Tipps and tricks",
      "Contribute",
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          HeroWidget(title: 'save trees'),
          SizedBox(height: 10),
          ...List.generate(3, (index) {
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
