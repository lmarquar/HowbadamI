import 'package:flutter/material.dart';
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
    return AppPaddingScaffold(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return (TravelPage());
                },
              ),
            );
          },
          child: Text('Travel'),
        ),
        ElevatedButton(
          onPressed: () {
            Utils.showSuccessSnackBar('clicked on button 2');
          },
          child: Text('Button 2'),
        ),
      ],
    );
  }
}
