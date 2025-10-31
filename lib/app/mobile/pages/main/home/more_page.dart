import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/widgets/container_widget.dart';
import 'package:howbadami/app/mobile/widgets/hero_widget.dart';
import 'package:howbadami/core/theme/app_text_styles.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.basicLayout,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          HeroWidget(title: 'test app'),
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
