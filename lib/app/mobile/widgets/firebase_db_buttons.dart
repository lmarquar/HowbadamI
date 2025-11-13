import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/scaffolds/app_padding_scaffold.dart';
import 'package:howbadami/app/mobile/widgets/button_widget.dart';
import 'package:howbadami/core/firebase/database_service.dart';

class FirebaseDbButtons extends StatefulWidget {
  const FirebaseDbButtons({super.key});

  @override
  State<FirebaseDbButtons> createState() => _FirebaseDbButtonsState();
}

class _FirebaseDbButtonsState extends State<FirebaseDbButtons> {
  @override
  Widget build(BuildContext context) {
    return AppPaddingScaffold(
      children: [
        ButtonWidget(
          label: 'Create',
          callback: () {
            DatabaseService().create(
              path: 'name',
              data: {'name': 'This is Test'},
            );
          },
        ),
        SizedBox(height: 10),
        ButtonWidget(
          label: 'Read',
          callback: () async {
            await DatabaseService().read(path: 'name');
          },
        ),
        SizedBox(height: 10),
        ButtonWidget(
          label: 'Update',
          callback: () {
            DatabaseService().update(
              path: 'name',
              data: {'name': 'This is Test update'},
            );
          },
        ),
        SizedBox(height: 10),
        ButtonWidget(
          label: 'Delete',
          callback: () {
            DatabaseService().delete(path: 'name');
          },
        ),
      ],
    );
  }
}
